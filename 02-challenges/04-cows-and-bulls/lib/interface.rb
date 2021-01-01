# frozen_string_literal: true

require_relative 'cows_bulls'

def play
  num = generate_num
  guess = []
  while guess != num
    print 'Guess 4 digits number: '
    guess = gets.chomp.chars.map(&:to_i)
    cows = 0
    bulls = 0
    num.each do |n|
      guess.each do |g|
        if n == g && num.index(n) == guess.index(g)
          cows += 1
        elsif n == g && num.index(n) != guess.index(g)
          bulls += 1
        end
      end
    end
    puts "Cows: #{cows}, Bulls: #{bulls}"
  end
  puts "Yay! You guessed correct number #{num.join}!"
end

play
