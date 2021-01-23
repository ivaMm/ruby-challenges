# frozen_string_literal: true

require 'rect_area'

describe 'rect_area' do
  it 'should calculate area' do
    expect(rect_area([[0, 0], [0, -2], [3, 0], [3, -2]])).to eq(6)
  end
end
