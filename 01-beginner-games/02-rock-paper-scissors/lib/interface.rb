# frozen_string_literal: true

require_relative 'rock_paper_scissors'

p '~ ROCK PAPER SCISSORS ~'

p "Choose: 'r' for ROCK, 'p' for PAPER, 's' for SCISSORS"
print '> '
user = gets.chomp

comp = comp_choice

p "Computer: #{comp}"

# r > s, s > p, p > r
stat1 = (user == 'r' && comp == 's')
stat2 = (user == 's' && comp == 'p')
stat3 = (user == 'p' && comp == 'r')

if user == comp
  p "It's a Tie!"
elsif stat1 || stat2 || stat3
  p 'Yay! You won!'
else
  p 'You lost :('
end
