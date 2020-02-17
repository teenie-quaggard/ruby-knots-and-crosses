RSpec.describe Game do
  it "has a version number" do
    expect(Game::VERSION).not_to be nil
  end

  it "runs" do
    expect(1+1).to eq(2)
  end
end
