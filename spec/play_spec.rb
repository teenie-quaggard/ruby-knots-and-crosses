require 'play'
require 'board'
require 'output'

RSpec.describe Play do

    describe "#start" do
        it 'prints intro to game' do
            board = Board.new
            output = Output.new
            game = Play.new(:board => board, :output => output)
            
            expect do
                game.start
              end.to output("Howdy stranger. Welcome to Noughts and Crosses.\n").to_stdout
        end
    end


end