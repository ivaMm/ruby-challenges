# frozen_string_literal: true

require_relative 'guess_word'

def guess_word(words)
  p '~ GUESS WORD ~'

  word = get_valid_word(words)
  letters = word_letters(word)

  p letters
  print '> '
  start_time = Time.now
  answer = gets.chomp.downcase

  try = 1

  while answer != word
    try += 1
    p 'Try again!'
    print '> '
    answer = gets.chomp.downcase
  end

  elapsed = (Time.now - start_time).floor

  p "Yay! You guess the word #{word.upcase}"
  p "You needed #{pluralize(try, 'guess')} and #{pluralize(elapsed, 'second')}!"

  play_again
end

def pluralize(try, str)
  suff = (str.end_with?('s') ? 'es' : 's')
  try == 1 ? "#{try} #{str}" : "#{try} #{str}#{suff}"
end

def play_again
  p 'Play again? [Y/N]'
  print '> '
  answer = gets.chomp.downcase
  answer == 'y' ? guess_word(WORDS) : false
end

guess_word(WORDS)
