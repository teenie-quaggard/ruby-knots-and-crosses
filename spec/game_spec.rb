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
    expect(new_player.mark).to_not eq('O')
    expect(new_player.name).to_not eq('Bar')
  end
end

RSpec.describe Game::Board do
  it 'creates a board defaulting to a dimension of 3x3 but accepting parameters to change the number of squares' do
    default_board = Game::Board.new()
    big_board = Game::Board.new(9)
    expect(default_board.dimension).to eq(3)
    expect(big_board.dimension).to eq(9)
  end
end