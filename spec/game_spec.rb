require 'game'

RSpec.describe Game do
  it "has a version number" do
    expect(Game::VERSION).not_to be nil
  end

  it "runs" do
    expect(1+1).to eq(2)
  end

end

RSpec.describe Game::Intro do
  it "prints welcome statement" do
    expect(Game::Intro.welcome()).to eql("Hello sunshine. Welcome to Knots and Crosses.")
  end
end
