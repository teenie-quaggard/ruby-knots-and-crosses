require 'play'
require 'board'
require 'output'

RSpec.describe Play do

    describe "#start" do
        it 'prints intro to game' do
            board = Board.new
            output = Output.new(:board => board)
            game = Play.new(:board => board, :output => output)
            
            expect do
                game.start
              end.to output(/Howdy stranger. Welcome to Noughts and Crosses.\n/).to_stdout
        end


        it 'prints a new board' do
            board = Board.new
            output = Output.new(:board => board)
            game = Play.new(:board => board, :output => output)
            
            expect do
                game.start
              end.to output(/ 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n/).to_stdout
        end

        it 'prompts user to input a number' do
            board = Board.new
            output = Output.new(:board => board)
            game = Play.new(:board => board, :output => output)
            
            expect do
                game.start
              end.to output(/Choose and number from 1-9:\n/).to_stdout
        end
    end


end