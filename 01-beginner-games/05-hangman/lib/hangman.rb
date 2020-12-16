# frozen_string_literal: true

WORDS = %w[gazed for a long time into the exultant thick of the people and felt
           in his own breast the peace of goodness from the height of the porch
           he could see the lunar purity of the distant scale of things the
           sadness of light that had gone still and the submissive sleep of the
           entire world—a world that had cost so much labor and pain to organize
           that this had been forgotten by everyone so that they would not know
           the terror of living on further].freeze

def get_valid_word(words)
  words.map(&:downcase)
       .reject! { |word| word.match(/[^a-z]/) || word.length < 4 }
       .uniq
       .sample
       .upcase
       .chars
end
