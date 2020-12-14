# frozen_string_literal: true

require 'seat_locator'

describe 'find_best_seat' do
  let(:json_input) {
                     { 'venue': { 'layout': { 'rows': 10, 'columns': 50 } },
                       'seats':
                          { 'a34': { 'id': 'a34', 'row': 'a', 'column': 34,
                                    'status': 'AVAILABLE' },
                            'h1': { 'id': 'h1', 'row': 'h', 'column': 1,
                                    'status': 'AVAILABLE' },
                            'a8': { 'id': 'a8', 'row': 'a', 'column': 8,
                                    'status': 'AVAILABLE' },
                            'a33': { 'id': 'a33', 'row': 'a', 'column': 33,
                                     'status': 'AVAILABLE' },
                            'a32': { 'id': 'a32', 'row': 'a', 'column': 32,
                                     'status': 'AVAILABLE' },
                            'a9': { 'id': 'a9', 'row': 'a', 'column': 9,
                                    'status': 'AVAILABLE' },
                            'b5': { 'd': 'b5', 'row': 'b', 'column': 5,
                                    'status': 'AVAILABLE' },
                            'h7': { 'id': 'h7', 'row': 'h', 'column': 7,
                                    'status': 'AVAILABLE' } } }
                   }

  it 'should return best seat' do
    expect(find_best_seat(json_input)).to be_a String
    expect(find_best_seat(json_input)).to eq('a32')
  end
end

describe 'find_best_group_seats' do
  let(:json_input) {
                     { 'venue': { 'layout': { 'rows': 10, 'columns': 50 } },
                       'seats':
                          { 'a34': { 'id': 'a34', 'row': 'a', 'column': 34,
                                    'status': 'AVAILABLE' },
                            'h1': { 'id': 'h1', 'row': 'h', 'column': 1,
                                    'status': 'AVAILABLE' },
                            'a8': { 'id': 'a8', 'row': 'a', 'column': 8,
                                    'status': 'AVAILABLE' },
                            'a33': { 'id': 'a33', 'row': 'a', 'column': 33,
                                     'status': 'AVAILABLE' },
                            'a32': { 'id': 'a32', 'row': 'a', 'column': 32,
                                     'status': 'AVAILABLE' },
                            'a9': { 'id': 'a9', 'row': 'a', 'column': 9,
                                    'status': 'AVAILABLE' },
                            'b5': { 'd': 'b5', 'row': 'b', 'column': 5,
                                    'status': 'AVAILABLE' },
                            'h7': { 'id': 'h7', 'row': 'h', 'column': 7,
                                    'status': 'AVAILABLE' } } }
                   }

  it 'should return best group seats' do
    expect(find_best_group_seats(json_input)).to eq('a32 & a33')
    expect(find_best_group_seats(json_input, 3)).to eq('a32 & a33 & a34')
  end
end
