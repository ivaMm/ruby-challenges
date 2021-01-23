# frozen_string_literal: true

require 'rupees'

describe 'rupees_coins' do
  let(:result) {
                 {
                    rupees_coins1: 600,
                    paisa_coins50: 1200,
                    paisa_coins25: 2400
                 }
               }

  it 'should return an amount of coins' do
    expect(rupees_coins(1800, 1, 2, 4)).to eq(result)
  end
end
