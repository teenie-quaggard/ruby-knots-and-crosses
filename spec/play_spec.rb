require 'play'
# require 'board'

RSpec.describe Play do

    RSpec.describe "#start" do
        it 'prints intro to game' do
            game = Play.new()
            game.start()
            
        end
    end
end