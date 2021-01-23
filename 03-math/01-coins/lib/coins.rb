# frozen_string_literal: true

# TODO: given a positive integer ranging from 1 to 250
# and coins [1, 9, 7, 5, 3, 1]
# return the least number of coins which sum is the given integer.

def coins_amount(num)
  coins = [11, 9, 7, 5, 3, 1]
  amount = 0
  while num.positive?
    coins.each do |c|
      if num / c >= 1
        amount += num / c
        num = num % c
      end
    end
  end
  amount
end
