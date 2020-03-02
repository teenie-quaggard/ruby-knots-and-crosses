require 'board'

RSpec.describe Board do
    it 'can be initialized with an array of spaces' do
        board = Board.new()
        expect(board.tiles).to eq({
            0 => nil,
            1 => nil,
            2 => nil,
            3 => nil,
            4 => nil,
            5 => nil,
            6 => nil,
            7 => nil,
            8 => nil
        })
    end

    it '#make_move replaces number in the tile array with a marker' do
        board = Board.new()
        board.make_move("X", "1")
        expect(board.tile_content(1)).to eq("X")
    end

    it '#tile_content returns data from a tile' do
        board = Board.new()
        board.make_move("X", "1")
        expect(board.tile_content(1)).to eq ("X")
        expect(board.tile_content(2)).to eq (nil)
    end


end