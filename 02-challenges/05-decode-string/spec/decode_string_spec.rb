# frozen_string_literal: true

require 'decode_string'

describe 'caesar_cipher' do
  it 'should decode string' do
    expect(caesar_cipher('fcjjm, pszw!')).to eq('hello, ruby!')
  end
end
