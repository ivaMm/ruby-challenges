# frozen_string_literal: true

def decode_string(some_string)
  some_string.downcase.split(/\b/).map { |w| decode_word(w) }.join
end

def decode_word(word)
  alphabet = ('a'..'z').to_a
  word.chars.map do |c|
    if alphabet.include?(c)
      x = alphabet.index(c) + 2
      x < alphabet.length ? x : x = alphabet.index(c) + 2 - alphabet.length
      alphabet[x]
    else
      c
    end
  end.join
end

p decode_string('jgnnq, twda!')
