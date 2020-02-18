require 'game'

RSpec.describe Game do
  
  it "has a version number" do
    expect(Game::VERSION).not_to be nil
  end

end

RSpec.describe Game::Display do
  WELCOME_MESSAGE = "Hello sunshine. Welcome to Noughts and Crosses."
  GAME_RULES = "These are the rules of the game."

  specify { expect { Game::Display.prints_message(WELCOME_MESSAGE) }.to output.to_stdout }
  specify { expect { Game::Display.prints_message(WELCOME_MESSAGE) }.to output("Hello sunshine. Welcome to Noughts and Crosses.\n").to_stdout }
  specify { expect { Game::Display.prints_message(WELCOME_MESSAGE) }.to output(/Hello sunshine. Welcome to Noughts and Crosses./).to_stdout }
  specify { expect { }.to_not output.to_stdout }
  specify { expect { Game::Display.prints_message(WELCOME_MESSAGE) }.to_not output('bar').to_stdout }
  specify { expect { Game::Display.prints_message(WELCOME_MESSAGE) }.to_not output(/bar/).to_stdout }


end
