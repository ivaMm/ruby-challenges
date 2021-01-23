# frozen_string_literal: true

# TODO: given coordinates of rectangle as 2d array [[0,0],[0,-2],[3,0],[3,-2]]
# calculate area

def rect_area(arr)
  x = arr.map { |e| e[0] }.uniq
  y = arr.map { |e| e[1] }.uniq
  width = x.max - x.min
  height = y.max - y.min
  (width * height).abs
end
