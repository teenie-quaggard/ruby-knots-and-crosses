require 'game'

RSpec.describe Game do
  
  it "has a version number" do
    expect(Game::VERSION).not_to be nil
  end

end

RSpec.describe Game::Display do
  it "prints statement" do
    WELCOME_MESSAGE = "Hello sunshine. Welcome to Noughts and Crosses."
    GAME_RULES = "These are the rules of the game."
    expect(Game::Display.prints_message(WELCOME_MESSAGE)).to eql("Hello sunshine. Welcome to Noughts and Crosses.")
    expect(Game::Display.prints_message(GAME_RULES)).to eql("These are the rules of the game.")

  end

  it "prints board" do
    BOARD = "\n\n1 | 2 | 3\n---------\n4 | 5 | 6\n---------\n7 | 8 | 9\n\n\n"
    expect(Game::Display.prints_message(BOARD)).to eql("\n\n1 | 2 | 3\n---------\n4 | 5 | 6\n---------\n7 | 8 | 9\n\n\n")
  end
end
