# frozen_string_literal: true

require 'polydivisible'

describe 'polydivisible?' do
  it 'should take 1 parameter' do
    expect(method(:polydivisible?).arity).to eq(1)
  end

  it 'should return true or false' do
    expect(polydivisible?(1232)).to eq(true)
    expect(polydivisible?(1233)).to eq(false)
  end
end
