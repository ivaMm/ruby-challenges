# frozen_string_literal: true

require 'decode_string'

describe 'decode_string' do
  it 'should take one parameter' do
    expect(method(:decode_string).arity).to eq(1)
  end

  it 'should decode string' do
    expect(decode_string('fcjjm, pszw!')).to eq('hello, ruby!')
  end
end
