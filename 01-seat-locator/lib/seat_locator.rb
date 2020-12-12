def get_values(json_input)
  # { "venue": { "layout": { "rows": 10, "columns": 50 } },
  # "seats":
  # { "a1": { "id": "a1", "row": "a", "column": 1, "status": "AVAILABLE" },
  # "a2": { "id": "a2", "row": "a", "column": 2, "status": "AVAILABLE" },
  # "a4": { "id": "a4", "row": "a", "column": 4, "status": "AVAILABLE" },
  # "b5": { "id": "b5", "row": "b", "column": 5, "status": "AVAILABLE" },
  # "h7": { "id": "h7", "row": "h", "column": 7, "status": "AVAILABLE" } } }

  {
    rows: json_input[:venue][:layout][:rows],
    columns: json_input[:venue][:layout][:columns],
    seats: json_input[:seats].keys.map(&:to_s)
  }
end

def row_score(json_input)
  rows = get_values(json_input)[:rows]
  row_keys = ('a'..'z').to_a[0...rows]
  row_values = (1..rows).to_a.reverse
  row_keys.zip(row_values).to_h
end

def col_score(json_input)
  col = get_values(json_input)[:columns]
  col_keys = (1..col).to_a.map(&:to_s)
  col_values = col.even? ? values_even(col) : values_odd(col)
  col_keys.zip(col_values).to_h
end

def values_even(col)
  val = (1..col / 2).to_a
  val << val.reverse
  val.flatten
end

def values_odd(col)
  val = []
  val1 = (1..col / 2).to_a
  val << val1 + [col / 2 + 1] + val1.reverse
  val.flatten
end

def best_seat(json_input)
  row_score = row_score(json_input)
  col_score = col_score(json_input)
  seats_keys = get_values(json_input)[:seats]
  seat_score = get_values(json_input)[:seats].map { |i| [i[0], i[1..-1]] }
  seat_score.map! do |seat|
    [row_score[seat[0]], col_score[seat[1]]].sum
  end.max
  seats_keys.zip(seat_score).to_h.sort_by { |_k, v| -v }.first[0]
end

# group consecutive seats (in rows)
def group_seats(json_input)
  seats = get_values(json_input)[:seats]
  seats.group_by { |el| el[0] }
       .transform_values { |el| el.map { |e| e.gsub(/[a-z]/, '').to_i } }
       .transform_values(&:sort)
       .transform_values { |v| v.chunk_while { |i, j| i + 1 == j }.to_a }
       .transform_values { |val| val.select { |v| v.length > 1 } }
       .sort_by { |k, _v| -k }
       .reject { |el| el[1].empty? }
end

def find_group_seats(json_input, people)
  consecutive_seats = group_seats(json_input)
  consecutive_seats.map { |el| el[1].reject! { |e| e.length < people } }
  consecutive_seats[1].nil? ? "Sorry! There is no consecutive seats for #{people} people" : best_group_seats(consecutive_seats, people)
    # calculate best group seats
    # "#{consecutive_seats}"
end

def best_group_seats(consecutive_seats, people)
  # row_score = row_score(json_input)
  # col_score = col_score(json_input)

     #.map { |el| el[0] = row_score[el[0]], el[1] = el[1] } #.map { |e| e.map { |i| i = col_score[i.to_s] } } }
     #.map { |el| el[0] = el[0], el[1] = el[1].map { |e| e.map { |i| i = col_score[i.to_s] } } }
     #.map { |el| el[1] = el[1].map { |e| e = col_score[e.to_s] } }
end

# { "venue": { "layout": { "rows": 10, "columns": 50 } },"seats":{ "a3": { "id": "a3", "row": "a", "column": 3, "status": "AVAILABLE" },"a2": { "id": "a2", "row": "a", "column": 2, "status": "AVAILABLE" },"a9": { "id": "a9", "row": "a", "column": 9, "status": "AVAILABLE" },"b5": { "id": "b5", "row": "b", "column": 5, "status": "AVAILABLE" },"h7": { "id": "h7", "row": "h", "column": 7, "status": "AVAILABLE" } } }

p best_seat({ "venue": { "layout": { "rows": 10, "columns": 50 } },"seats":{ "a3": { "id": "a3", "row": "a", "column": 3, "status": "AVAILABLE" },"a2": { "id": "a2", "row": "a", "column": 2, "status": "AVAILABLE" },"a9": { "id": "a9", "row": "a", "column": 9, "status": "AVAILABLE" },"b5": { "id": "b5", "row": "b", "column": 5, "status": "AVAILABLE" },"h7": { "id": "h7", "row": "h", "column": 7, "status": "AVAILABLE" } } })

p group_seats({ "venue": { "layout": { "rows": 10, "columns": 50 } },"seats":{ "h1": { "id": "h1", "row": "h", "column": 1, "status": "AVAILABLE" }, "a8": { "id": "a8", "row": "a", "column": 8, "status": "AVAILABLE" }, "a3": { "id": "a3", "row": "a", "column": 3, "status": "AVAILABLE" },"a2": { "id": "a2", "row": "a", "column": 2, "status": "AVAILABLE" },"a9": { "id": "a9", "row": "a", "column": 9, "status": "AVAILABLE" },"b5": { "id": "b5", "row": "b", "column": 5, "status": "AVAILABLE" },"h7": { "id": "h7", "row": "h", "column": 7, "status": "AVAILABLE" } } })

p find_group_seats({ "venue": { "layout": { "rows": 10, "columns": 50 } },"seats":{ "h1": { "id": "h1", "row": "h", "column": 1, "status": "AVAILABLE" }, "a8": { "id": "a8", "row": "a", "column": 8, "status": "AVAILABLE" }, "a3": { "id": "a3", "row": "a", "column": 3, "status": "AVAILABLE" },"a2": { "id": "a2", "row": "a", "column": 2, "status": "AVAILABLE" },"a9": { "id": "a9", "row": "a", "column": 9, "status": "AVAILABLE" },"b5": { "id": "b5", "row": "b", "column": 5, "status": "AVAILABLE" },"h7": { "id": "h7", "row": "h", "column": 7, "status": "AVAILABLE" } } }, 3)
