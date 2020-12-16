# frozen_string_literal: true

require 'guess_word'

describe '#guess_word' do
  let(:words) { %w[A dynamic open source programming language] }

  it '#get_valid_word should return string' do
    expect(get_valid_word(words)).to be_a String
  end

  it '# word_letters should return string' do
    expect(word_letters('programming')).to be_a String
  end
end
