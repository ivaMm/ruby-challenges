# frozen_string_literal: true

require 'guess_number'

describe '#get_number' do
  it 'should take 1 parameter' do
    expect(method(:get_number).arity).to eq(1)
  end

  it 'should return integer' do
    expect(get_number(10)).to be_a Integer
    expect(get_number(10)).to be < 11
  end
end
