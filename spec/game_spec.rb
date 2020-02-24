require 'game'

# Rspec.describe Game do
#   it '#start_game welcomes the user when game starts' do
#     game = Game.new()
#     expect(game.welcome()).to 
#   end
# end


RSpec.describe Game do
  describe '#start_game' do
    it 'welcomes the user when game starts' do
    game = Game.new()

    expect do
          game.start_game()
        end.to output("Hello stranger. Let's play Noughts and Crosses. Would you like to review the rules of the game? (Y/N)").to_stdout
 
  end
  end



end