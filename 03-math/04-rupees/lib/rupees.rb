# frozen_string_literal: true

# TODO: Given the total number of Rupees in a bag and the ratio of coins.
# The bag contains only 1 Rs, 50 paise (1/2 Rs), 25 paise (1/4 Rs) coins in
# X, Y, Z, ratio.
# The task is to determine the number of 1 Rs coins, 50 Paise coins,
# and 25 paise coins So that after summation of all these we again get the
# total rupees given

def rupees_coins(rupees, x_coin, y_coin, z_coin)
  factor = rupees / 3
  {
    rupees_coins1: factor * x_coin,
    paisa_coins50: factor * y_coin,
    paisa_coins25: factor * z_coin
  }
end
