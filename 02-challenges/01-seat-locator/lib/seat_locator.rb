# frozen_string_literal: true

# seats.reject! { |k, v| v.has_value?('NO AVAILABLE') }
def get_values(json_input)
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

def find_best_seat(json_input)
  row_score = row_score(json_input)
  col_score = col_score(json_input)
  seat_score = get_values(json_input)[:seats].map { |i| [i[0], i[1..-1]] }
  seat_score.map! { |seat| [row_score[seat[0]], col_score[seat[1]]].sum }.max
  (get_values(json_input)[:seats]).zip(seat_score).to_h.min_by { |_k, v| -v }[0]
end

# group seats (by rows)
def group_seats(json_input)
  seats = get_values(json_input)[:seats]
  seats.group_by { |el| el[0] }
       .transform_values { |el| el.map { |e| e.gsub(/[a-z]/, '').to_i } }
       .transform_values(&:sort)
       .transform_values { |v| v.chunk_while { |i, j| i + 1 == j }.to_a }
end

# find consecutive seats
def find_best_group_seats(json_input, people = 2)
  return false if people <= 1

  consecutive_seats = group_seats(json_input)
  consecutive_seats.map { |_k, val| val.select! { |v| v.length >= people } }

  if consecutive_seats.empty?
    "Sorry! There is no consecutive seats for #{people} people"
  else
    best_group_seats(consecutive_seats, json_input, people)
  end
end

def best_group_seats(consecutive_seats, json_input, people)
  row_score = row_score(json_input)
  col_score = col_score(json_input)

  seats = consecutive_seats.map { |k, val| val.map { |vl| vl.map { |v| k + v.to_s } } }
                           .flatten

  scores = consecutive_seats.transform_values { |val|  val.map { |vl| vl.map { |v| col_score[v.to_s] } } }
                            .map { |k, val| val.map { |vl| vl.map { |v| v + row_score[k] } } }
                            .flatten

  seats.zip(scores).to_h.sort_by { |_k, v| -v }.to_h.keys.first(people)
       .sort_by { |k| k.gsub(/[a-z]/, '').to_i }.join(' & ')
end
