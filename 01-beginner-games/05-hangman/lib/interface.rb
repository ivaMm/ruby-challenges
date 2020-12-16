# frozen_string_literal: true

require_relative 'hangman'

def hangman(words, lives = 6)
  used_letters = []
  word = get_valid_word(WORDS)
  alphabet = ('A'..'Z').to_a
  current_word = ('_' * word.length).split('')

  p '~ HANGMAN ~'

  while current_word != word && lives.positive?

    p "You have #{lives} lives"

    p "Used letters: #{used_letters.join(', ')}" unless used_letters.empty?

    p current_word.join(' ')
    p 'Your guess:'
    print '> '

    user_letter = gets.chomp.upcase

    if alphabet.include?(user_letter)

      if used_letters.include?(user_letter) || current_word.include?(user_letter)
        p "You already used letter #{user_letter}. Guess another one!"

      elsif word.include?(user_letter)
        word.each_with_index do |el, i|
          if el == user_letter
            current_word[i] = user_letter
          end
          current_word
        end

      else
        lives -= 1
        p "Sorry, there's no letter #{user_letter}. Guess another one!" unless lives.zero?
        used_letters << user_letter
      end

    else
      p "#{user_letter} is not valid letter!"
    end
  end

  if lives.zero?
    p "You died, sorry. The word was #{word.join}"
  else
    p "YAY! You guessed the word #{word.join}!!"
  end

  play_again
end

def play_again
  p 'Play again? [Y/N]'
  print('> ')
  answer = gets.chomp.downcase
  answer == 'y' ? hangman(WORDS) : false
end

hangman(WORDS)
