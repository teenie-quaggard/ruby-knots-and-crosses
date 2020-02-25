require 'board'

RSpec.describe Board do
    it 'can be initialized with an array of spaces' do
        board = Board.new()
        board2 = Board.new(:tiles => [1,2,3,4,5,6,7,8,9,10,11,12,13,14])
        expect(board.tiles).to eq([1,2,3,4,5,6,7,8,9])
        expect(board2.tiles).to eq([1,2,3,4,5,6,7,8,9,10,11,12,13,14])
    end

    it '#make_move replaces number in the tile array with a marker' do
        board = Board.new()
        board.make_move("X", 1)
        expect(board.tiles).to eq(["X",2,3,4,5,6,7,8,9])
    end

    it '#new_board creates a board empty of markers' do
        board = Board.new(:tiles => ["X",2,"O",4,5,6,7,8,9])
        BOARD_RESET = [1,2,3,4,5,6,7,8,9]
        board.new_board(BOARD_RESET)
        expect(board.tiles).to eq([1,2,3,4,5,6,7,8,9])
    end


end