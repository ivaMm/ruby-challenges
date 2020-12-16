# frozen_string_literal: true

require 'rock_paper_scissors'

describe '#rock_paper_scissors' do
  it 'should return string' do
    expect(comp_choice).to be_a String
  end

  it 'should match r, p or s' do
    expect(comp_choice).to match(/[rps]/)
  end
end
