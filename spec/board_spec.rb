require 'board'

RSpec.describe Board do
    it 'can be initialized with an array of spaces' do
        board = Board.new()
        expect(board.tiles).to eq({
            0 => 1,
            1 => 2,
            2 => 3,
            3 => 4,
            4 => 5,
            5 => 6,
            6 => 7,
            7 => 8,
            8 => 9
        })
    end

    it '#make_move replaces number in the tile array with a marker' do
        board = Board.new()
        board.make_move("X", "1")
        expect(board.tiles).to eq({0=>"X", 1=>2, 2=>3, 3=>4, 4=>5, 5=>6, 6=>7, 7=>8, 8=>9})
    end

    it '#tile_content returns data from a tile' do
        board = Board.new()
        expect(board.tile_content(2)).to eq (2)
    end


end