require_relative 'board'
describe Board do
    it 'can be initialized with an array of spaces' do
        board = Board.new(:board_spaces => [1,2,3,4,5,6,7,8,9])
        expect(board.board_spaces).to eq([1,2,3,4,5,6,7,8,9])
    end
end