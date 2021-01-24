# frozen_string_literal: true

# TODO: given coordinates of 2 rectangles as multidimensional array
# [[[0,0],[0,-2],[3,0],[3,-2]], [[2,-1],[3,-1],[2,3],[3,3]]]
# calculate overlap area if they overlap, if not return false

def rect_overlap(arr)
  # build rectangles
  r1 = build_rect(arr[0])
  r2 = build_rect(arr[1])

  # check do they overlap
  if r1[:right] <= r2[:left] || # r1 is to the left of r2
     r1[:left] >= r2[:right] || # r1 is to the right of r2
     r1[:top] <= r2[:bottom] || # r1 is lower then r2
     r1[:bottom] >= r2[:top] # r1 is above r2
    false
  else
    overlap_area(r1, r2) # TODO!
  end
end

def build_rect(arr)
  rx = arr.map { |e| e[0] }.uniq
  ry = arr.map { |e| e[1] }.uniq
  {
    left: rx.min,
    right: rx.max,
    top: ry.max,
    bottom: ry.min
  }
end

def overlap_area(rect1, rect2)
  x_overlap = [rect1[:left], rect2[:left], rect1[:right], rect2[:right]].sort[1..2]
  y_overlap = [rect1[:top], rect2[:top], rect1[:bottom], rect2[:bottom]].sort[1..2]
  (x_overlap.reduce(&:-) * y_overlap.reduce(&:-)).abs
end
