# frozen_string_literal: true

def polydivisible?(num, base)
  nums = num.to_s.chars
  i = 0
  arr = []
  while i < nums.length
    arr << nums[0..i]
    i += 1
  end
  arr.map! { |n| n.join.to_i(base) % (arr.index(n) + 1) }
     .all?(&:zero?)
end
