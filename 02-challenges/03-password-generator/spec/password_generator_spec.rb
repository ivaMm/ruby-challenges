# frozen_string_literal: true

require 'password_generator'

describe 'password_generator' do
  it 'should take 1 parameter' do
    expect(method(:password_generator).arity).to eq(1)
  end

  it 'should return string' do
    expect(password_generator(8)).to be_a String
  end
end
