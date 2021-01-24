# frozen_string_literal: true

require 'coins'

describe 'coins_amount' do
  it 'should return a least amount of coins' do
    expect(coins_amount(25)).to eq(3)
    expect(coins_amount(34)).to eq(4)
    expect(coins_amount(14)).to eq(2)
  end
end
