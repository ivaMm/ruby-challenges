# frozen_string_literal: true

require 'rect_overlap'

describe 'rect_overlap' do
  let(:rect1) {
                [
                  [
                    [0, 0],
                    [0, -3],
                    [-3, 0],
                    [-3, -3]
                  ],
                  [
                    [0, 0],
                    [0, 3],
                    [3, 0],
                    [3, 3]
                  ]
                ]
              }

  let(:rect2) {
                [
                  [
                    [0, 0],
                    [0, -2],
                    [3, 0],
                    [3, -2]
                  ],
                  [
                    [2, -1],
                    [3, -1],
                    [2, 3],
                    [3, 3]
                  ]
                ]
              }
  it 'should return false' do
    expect(rect_overlap(rect1)).to eq(false)
  end
  it 'should calculate overlap area' do
    expect(rect_overlap(rect2)).to eq(1)
  end
end
