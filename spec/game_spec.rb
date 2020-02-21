require 'game'

RSpec.describe Game do
  it "has a version number" do
    expect(Game::VERSION).not_to be nil
  end
end

# RSpec.describe Game::Output do
#   WELCOME_MESSAGE = "Hello sunshine. Welcome to Noughts and Crosses."
#   specify { expect { Game::Output.prints_message(WELCOME_MESSAGE) }.to output.to_stdout }
#   specify { expect { Game::Output.prints_message(WELCOME_MESSAGE) }.to output("Hello sunshine. Welcome to Noughts and Crosses.\n").to_stdout }
#   specify { expect { Game::Output.prints_message(WELCOME_MESSAGE) }.to output(/Hello sunshine. Welcome to Noughts and Crosses./).to_stdout }
#   specify { expect { }.to_not output.to_stdout }
#   specify { expect { Game::Output.prints_message(WELCOME_MESSAGE) }.to_not output('bar').to_stdout }
#   specify { expect { Game::Output.prints_message(WELCOME_MESSAGE) }.to_not output(/bar/).to_stdout }
# end

RSpec.describe Game::Player do
  it 'creates a new player with a mark and name' do
    new_player = Game::Player.new('X', 'Straight Shooter')
    expect(new_player.mark).to eq('X')
    expect(new_player.name).to eq('Straight Shooter')
    expect(new_player.mark).to_not eq('O')
    expect(new_player.name).to_not eq('')
  end
end

RSpec.describe Game::Output do
  describe '#prints_empty_board method' do
    it 'prints a board to the console' do
    #   output = Game::Output.new(:board => Game::BoardConstructor.create_board(Game::BoardConstructor.create_board_tiles))
    board = Game::BoardConstructor.new(:single_tile => Game::Tile)
    board.create_board()
    output = Game::Output.new(:board => board.board_tiles)

    expect do
          output.prints_empty_board()
        end.to output("  1  |  2  |  3  \n-----------------\n  4  |  5  |  6  \n-----------------\n  7  |  8  |  9  \n").to_stdout
    end
  end
end

RSpec.describe Game::Tile do
  it '#create_empty_tile creates an empty tile' do
    tile = Game::Tile.new()
    expect(tile.create_empty_tile(4)).to eq("    ")
  end

  it '#populate_tile creates an tile with a number in the middle of the empty string' do
    tile = Game::Tile.new()
    empty_tile = "    "
    expect(tile.populate_tile(empty_tile, 1)).to eq("  1  ")
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
    board = Game::BoardConstructor.new(:single_tile => Game::Tile)
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
