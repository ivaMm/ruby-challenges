# frozen_string_literal: true

def caesar_cipher(some_string, num = 2)
  some_string.downcase.split(/\b/).map { |w| decode_word(w, num) }.join
end

def decode_word(word, num)
  alphabet = ('a'..'z').to_a
  word.chars.map do |c|
    if alphabet.include?(c)
      x = alphabet.index(c) + num
      x < alphabet.length ? x : x = x % alphabet.length
      alphabet[x]
    else
      c
    end
  end.join
end
