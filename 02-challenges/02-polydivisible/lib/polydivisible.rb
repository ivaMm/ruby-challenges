# frozen_string_literal: true

def polydivisible?(num)
  nums = num.digits.reverse
  i = 0
  arr = []
  while i < nums.length
    arr << nums[0..i]
    i += 1
  end
  arr.map! { |n| n.join.to_i % (arr.index(n) + 1) }
     .all?(&:zero?)
end
