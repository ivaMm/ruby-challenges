# frozen_string_literal: true

require 'rect_area'

describe 'rect_area' do
  it 'should calculate area' do
    expect(rect_area([[0, 0], [0, -2], [3, 0], [3, -2]])).to eq(6)
    expect(rect_area([[2, -1], [3, -1], [2, 3], [3, 3]])).to eq(4)
    expect(rect_area([[0, 0], [-3, 0], [0, -3], [-3, -3]])).to eq(9)
    expect(rect_area([[0, 0], [-3, 0], [0, 3], [-3, 3]])).to eq(9)
    expect(rect_area([[0, 0], [3, 0], [0, 3], [3, 3]])).to eq(9)
    expect(rect_area([[-1, -1], [-3, -1], [-1, -3], [-3, -3]])).to eq(4)
  end
end
