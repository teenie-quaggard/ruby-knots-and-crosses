require 'board'

RSpec.describe Board do
    it 'can be initialized with an array of spaces' do
        board = Board.new()
        expect(board.board_spaces).to eq([1,2,3,4,5,6,7,8,9])
    end

    it '#new_board creates a board empty of markers' do
        board = Board.new(:board_spaces => ["X",2,"O",4,5,6,7,8,9])
        BOARD_RESET = [1,2,3,4,5,6,7,8,9]
        board.new_board(BOARD_RESET)
        expect(board.board_spaces).to eq([1,2,3,4,5,6,7,8,9])
    end
end