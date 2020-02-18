require 'game'

RSpec.describe Game do
  it "has a version number" do
    expect(Game::VERSION).not_to be nil
  end
end

RSpec.describe Game::Display do
  WELCOME_MESSAGE = "Hello sunshine. Welcome to Noughts and Crosses."
  specify { expect { Game::Display.prints_message(WELCOME_MESSAGE) }.to output.to_stdout }
  specify { expect { Game::Display.prints_message(WELCOME_MESSAGE) }.to output("Hello sunshine. Welcome to Noughts and Crosses.\n").to_stdout }
  specify { expect { Game::Display.prints_message(WELCOME_MESSAGE) }.to output(/Hello sunshine. Welcome to Noughts and Crosses./).to_stdout }
  specify { expect { }.to_not output.to_stdout }
  specify { expect { Game::Display.prints_message(WELCOME_MESSAGE) }.to_not output('bar').to_stdout }
  specify { expect { Game::Display.prints_message(WELCOME_MESSAGE) }.to_not output(/bar/).to_stdout }
end

RSpec.describe Game::Player do
  it 'creates a new player with a mark and name' do
    new_player = Game::Player.new('X', 'Straight Shooter')
    expect(new_player.mark).to eq('X')
    expect(new_player.name).to eq('Straight Shooter')
    expect(new_player.mark).to_not eq('O')
    expect(new_player.name).to_not eq('Bar')
  end
end

RSpec.describe Game::Board do
  it 'creates a board defaulting to a dimension of 3 but accepting a parameter to change the number of squares across' do
    default_board = Game::Board.new()
    big_board = Game::Board.new(9)
    expect(default_board.dimension).to eq(3)
    expect(big_board.dimension).to eq(9)
  end

  it 'create_grid makes an array with a series of numbers which correspond to the dimensions squared' do
    default_board = Game::Board.new()
    big_board = Game::Board.new(4)
    expect(default_board.create_grid(3)).to eq([1,2,3,4,5,6,7,8,9])
    expect(big_board.create_grid(4)).to eq([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16])
  end

  it '@squares is equal to an array of numbers corresponding to a grid size' do
    default_board = Game::Board.new()
    big_board = Game::Board.new(4)
    expect(default_board.squares).to eq([1,2,3,4,5,6,7,8,9])
    expect(big_board.squares).to eq([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16])
  end

  describe 'prints_board method' do
    it 'prints a board to the console using the @squares attribute' do
      squares = [1,2,3,4,5,6,7,8,9]
      board = Game::Board.new()
      expect do
        board.prints_board(squares)
      end.to output("  
          1  |  2  |  3  
        -----------------      
          4  |  5  |  6  
        -----------------   
          7  |  8  |  9  \n").to_stdout
    end
  end


end