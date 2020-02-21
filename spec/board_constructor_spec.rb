require 'formatter'
require 'board_constructor'
# TODO: ensure dimension is positive, odd, whole number
RSpec.describe BoardConstructor do
    it 'creates a board defaulting to a dimension of 3 but accepting a parameter to change the number of tiles across' do
      default_board = BoardConstructor.new()
      big_board = BoardConstructor.new(:dimension => 9)
      expect(default_board.dimension).to eq(3)
      expect(big_board.dimension).to eq(9)
    end
  
    it 'board_spaces makes an array with a series of numbers which correspond to the dimensions squared' do
      default_board = BoardConstructor.new()
      big_board = BoardConstructor.new(:dimension => 4)
      expect(default_board.board_spaces(3)).to eq([1,2,3,4,5,6,7,8,9])
      expect(big_board.board_spaces(4)).to eq([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16])
    end
  
    it '#create_board_tiles method creates an array of the individual board tiles' do
      board = BoardConstructor.new(:single_tile => Tile)
      board_spaces = [1,2,3,4,5,6,7,8,9]
      expect(board.create_board_tiles(board_spaces, Formatter)).to eq(["  1  |", "  2  |", "  3  \n-----------------\n", "  4  |", "  5  |", "  6  \n-----------------\n", "  7  |", "  8  |", "  9  "])
    end
  end
  