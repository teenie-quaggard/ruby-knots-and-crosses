require 'game'

RSpec.describe Game do
  
  it "has a version number" do
    expect(Game::VERSION).not_to be nil
  end

end

RSpec.describe Game::PrintsMessageToUser do
  it "prints statement" do
    WELCOME_MESSAGE = "Hello sunshine. Welcome to Knots and Crosses."
    GAME_RULES = "These are the rules of the game."
    expect(Game::PrintsMessageToUser.prints_message(WELCOME_MESSAGE)).to eql("Hello sunshine. Welcome to Knots and Crosses.")
    expect(Game::PrintsMessageToUser.prints_message(GAME_RULES)).to eql("These are the rules of the game.")

  end

  it "prints board" do
    BOARD = '1|2|3 /n 4|5|6 /n 7/8/9'
    expect(Game::PrintsMessageToUser.prints_message(BOARD)).to eql('1|2|3 /n 4|5|6 /n 7|8|9')
  end
end
