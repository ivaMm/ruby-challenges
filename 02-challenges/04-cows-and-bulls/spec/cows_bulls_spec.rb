# frozen_string_literal: true

require 'cows_bulls'

describe 'generate_num' do
  it 'should take 1 parameter' do
    expect(method(:generate_num).arity).to eq(-1)
  end

  it 'should return array' do
    expect(generate_num(4)).to be_a Array
  end
end
