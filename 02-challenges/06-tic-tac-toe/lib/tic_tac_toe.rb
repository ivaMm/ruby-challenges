# frozen_string_literal: true

def game
  gameboard = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
  display_game = gameboard.map { |el| el.map { '_ ' } }
  display_game.each { |el| p el.join }
  all_moves = []
  winner = ''
  while all_moves.length < 9
    winner += check_winner(gameboard)
    break if winner != ''

    if all_moves.length.even?
      get_valid_move('X', all_moves)
      gameboard[all_moves.last[0] - 1][all_moves.last[1] - 1] = 1
      display_game[all_moves.last[0] - 1][all_moves.last[1] - 1] = 'X '
    else
      get_valid_move('O', all_moves)
      gameboard[all_moves.last[0] - 1][all_moves.last[1] - 1] = 2
      display_game[all_moves.last[0] - 1][all_moves.last[1] - 1] = 'O '
    end
    display_game.each { |el| p el.join }
  end
  winner == '' ? winner += "There's no moves left!" : winner
  p winner
  play_again
end

def get_valid_move(player, all_moves)
  p "Player #{player} move: "
  print '> '
  move = gets.chomp
  if move.match?(/\d{1},\s?\d{1}/)
    move = move.split(/,\s?/).map(&:to_i)
    if move.any? { |e| e < 1 || e > 3 }
      p '1 - 3 bitte'
      get_valid_move(player, all_moves)
    else
      if all_moves.include?(move)
        p 'Position is taken'
        get_valid_move(player, all_moves)
      else
        all_moves << move
      end
    end
  else
    p 'Specify row and column'
    get_valid_move(player, all_moves)
  end
  all_moves
end

def check_it(game)
  for x in game
    if x.uniq.length == 1
      if x[0].positive?
        winner = x[0]
      end
    end
  end
  winner
end

def check_col(game)
  game = game[0].zip(game[1], game[2])
  check_it(game)
end

def check_diagonals(game)
  game = [[game[0][0], game[1][1], game[2][2]], [game[0][2], game[1][1], game[2][0]]]
  check_it(game)
end

def check_winner(game)
  winner = ''
  if check_it(game)
    winner += "Winner is player #{check_it(game)}!"
  elsif check_col(game)
    winner += "Winner is player #{check_col(game)}!"
  elsif check_diagonals(game)
    winner += "Winner is player #{check_diagonals(game)}!"
  end
  winner
end

def play_again
  puts 'Play again? [Y/n]'
  print '> '
  answer = gets.chomp.downcase
  answer == 'y' ? game : false
end

game
