# frozen_string_literal: true

require 'polydivisible'

describe 'polydivisible?' do
  it 'should take 2 parameter' do
    expect(method(:polydivisible?).arity).to eq(2)
  end

  it 'should return true or false' do
    expect(polydivisible?(1232, 10)).to eq(true)
    expect(polydivisible?(1233, 10)).to eq(false)
    expect(polydivisible?(123_220, 6)).to eq(true)
    expect(polydivisible?(123_220, 10)).to eq(false)
  end
end
