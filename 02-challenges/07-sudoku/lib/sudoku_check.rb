# frozen_string_literal: true

def check_sudoku(sudoku)
  rows = sudoku.map(&:flatten!).select { |el| el.uniq.length == 9 }
  columns = rows[0].zip(*rows[1..8])
                   .select { |el| el.uniq.length == 9 }.length == 9
  blocks = sudoku[0].zip(*sudoku[1..8])
                    .map { |el| el.each_slice(3).to_a.flatten }
                    .select { |el| el.uniq.length == 9 }
                    .length == 9
  rows.length == 9 && columns && blocks
end
