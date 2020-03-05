require 'board'

RSpec.describe Board do
    it 'can make an empty board' do
        board = Board.empty
        expect(board.empty?).to eq(true) 
    end

    it 'is not empty if a move is added' do
        board = Board.empty
        board.make_move("X", 1)
        expect(board.empty?).to eq(false)
    end

    it 'can make a move' do
        board = Board.empty
        position = 1
        board.make_move("X", position)
        expect(board.spot_taken?(position)).to eq(true)
    end

    it '#make_move replaces number in the tile array with a marker' do
        board = Board.new
        board.make_move("X", "1")
        expect(board.tile_content(1)).to eq("X")
    end

    it '#tile_content returns data from a tile' do
        board = Board.new
        board.make_move("X", "1")
        expect(board.tile_content(1)).to eq ("X")
        expect(board.tile_content(2)).to eq (nil)
    end


    it '#bad_input? returns true if user inputs an integer that is within the range of the board' do
        board = Board.new
        expect(board.bad_input?("adadf")).to eq (true)
        expect(board.bad_input?("2000")).to eq (true)
        expect(board.bad_input?("3")).to eq (false)
    end


end