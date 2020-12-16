# frozen_string_literal: true

WORDS = %w[And if I die sometime — I’m going to die very soon — I know I’ll die
           as I am without accepting this world perceiving it close up and far
           away inside and out perceiving but not accepting it I’ll die and
           He will ask me Was it good there for you? Was it bad there for you
           I will be silent with lowered eyes I’ll be silent with that muteness
           familiar to everyone who knows the outcome of days of hard boozing.
           For isn’t the life of man a momentary booziness of the soul].freeze

def get_valid_word(words)
  words.map(&:downcase)
       .reject! { |word| word.match(/[^a-z]/) || word.length < 4 }
       .uniq
       .sample
end

def word_letters(word)
  word.upcase.chars.shuffle.join(' ')
end
