# frozen_string_literal: true

require 'rect_overlap'

describe 'rect_overlap' do
  let(:rect1) { [[[0, 0], [0, -3], [-3, 0], [-3, -3]], [[0, 0], [0, 3], [3, 0], [3, 3]]] }
  let(:rect2) { [[[0, 0], [0, -2], [3, 0], [3, -2]], [[2, -1], [3, -1], [2, 3], [3, 3]]] }
  let(:rect3) { [[[-4, -4], [-4, -4], [4, 4], [4, 4]], [[-2, -2], [-2, -2], [2, 2], [2, 2]]] }
  let(:rect4) {  [[[0, 0], [0, -2], [3, 0], [3, -2]], [[1, -5], [6, -5], [6, 3], [1, 3]]] }
  let(:rect5) { [[[0, 0], [-3, 0], [0, -4], [-3, -4]], [[-1, 3], [-1, -3], [-4, -3], [-4, 3]]] }

  it 'should return false' do
    expect(rect_overlap(rect1)).to eq(false)
  end
  it 'should calculate overlap area' do
    expect(rect_overlap(rect2)).to eq(1)
    expect(rect_overlap(rect3)).to eq(16)
    expect(rect_overlap(rect4)).to eq(4)
    expect(rect_overlap(rect5)).to eq(6)
  end
end
