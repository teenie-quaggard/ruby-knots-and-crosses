require 'game'

RSpec.describe Game do
  it "has a version number" do
    expect(Game::VERSION).not_to be nil
  end

  it "runs" do
    expect(1+1).to eq(2)
  end

end

RSpec.describe Game::PrintsMessageToUser do
  it "prints welcome statement" do
    WELCOME_MESSAGE = "Hello sunshine. Welcome to Knots and Crosses."
    GAME_RULES = "These are the rules of the game."
    expect(Game::PrintsMessageToUser.prints_message(WELCOME_MESSAGE)).to eql("Hello sunshine. Welcome to Knots and Crosses.")
    expect(Game::PrintsMessageToUser.prints_message(GAME_RULES)).to eql("These are the rules of the game.")

  end
end
