# frozen_string_literal: true

require 'madlibs'

describe '#madlibs' do
  let(:adj1) { 'heavy' }
  let(:adj2) { 'clumsy' }
  let(:adj3) { 'hungry' }
  let(:n1) { 'bear' }
  let(:n2) { 'face' }
  let(:n3) { 'candy' }

  let(:result) { "The #{adj1} #{n1} who goes with me. A manifold honey to
                 smear his #{n2}. #{adj2.capitalize} and lumbering here and
                 there. The central ton of every place. The #{adj3} beating
                 brutish one. In love with #{n3}, anger, and sleep!"
               }

  it 'should take 6 parameters' do
    expect(method(:madlibs).arity).to eq(6)
  end

  it 'should return string' do
    expect(madlibs(adj1, adj2, adj3, n1, n2, n3)).to be_a String
    expect(madlibs(adj1, adj2, adj3, n1, n2, n3)).to eq(result)
  end
end
