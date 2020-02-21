require 'game'
require 'tile'

RSpec.describe Game do
  it "has a version number" do
    expect(Game::VERSION).not_to be nil
  end
end


# TODO: ensure dimension is positive, odd, whole number
RSpec.describe Game::BoardConstructor do
  it 'creates a board defaulting to a dimension of 3 but accepting a parameter to change the number of tiles across' do
    default_board = Game::BoardConstructor.new()
    big_board = Game::BoardConstructor.new(:dimension => 9)
    expect(default_board.dimension).to eq(3)
    expect(big_board.dimension).to eq(9)
  end

  it 'board_spaces makes an array with a series of numbers which correspond to the dimensions squared' do
    default_board = Game::BoardConstructor.new()
    big_board = Game::BoardConstructor.new(:dimension => 4)
    expect(default_board.board_spaces(3)).to eq([1,2,3,4,5,6,7,8,9])
    expect(big_board.board_spaces(4)).to eq([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16])
  end

  it '#create_board_tiles method creates an array of the individual board tiles' do
    board = Game::BoardConstructor.new(:single_tile => Tile)
    board_spaces = [1,2,3,4,5,6,7,8,9]
    expect(board.create_board_tiles(board_spaces, Game::Formatter)).to eq(["  1  |", "  2  |", "  3  \n-----------------\n", "  4  |", "  5  |", "  6  \n-----------------\n", "  7  |", "  8  |", "  9  "])
  end
end

RSpec.describe Game::Formatter do
  it 'returns an Integer from a string' do
    formatter = Game::Formatter.new()
    string = "  1  "
    expect(formatter.find_int_in_string(string)).to eq(1)
  end

  it '#row_length method finds out the length of a given board based on dimensions of board and tile length' do
    formatter = Game::Formatter.new()
    dimension = 3
    tile_length = 4
    expect(formatter.row_length(dimension, tile_length)).to eq(17)
  end

  it '#format_tiles method takes a tile and appends a divider where necessary' do
    formatter1 = Game::Formatter.new(:tile_content => "  1  ")
    formatter3 = Game::Formatter.new(:tile_content => "  3  ")
    formatter9 = Game::Formatter.new(:tile_content => "  9  ")
    expect(formatter1.format_tiles()).to eq("  1  |")
    expect(formatter3.format_tiles()).to eq("  3  \n-----------------\n")
    expect(formatter9.format_tiles()).to eq("  9  ")
  end
  
end
