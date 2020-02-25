require 'output'
require 'board'

RSpec.describe Output do
    describe "#hello" do
        it 'prints intro to game' do
            output = Output.new   
            expect do
                output.hello
              end.to output("Howdy stranger. Welcome to Noughts and Crosses.\n").to_stdout
        end
    end

    describe "#prompt_turn" do
        it "prompts player to enter a number" do
            board = Board.new()
            output = Output.new(:board => board)
            expect do 
                output.prompt_turn
            end.to output("\nChoose and number from 1-9:\n").to_stdout
        end
    end

    describe "#board" do
        it "prints a new board" do
            BOARD_RESET = [1,2,3,4,5,6,7,8,9]
            board = Board.new()
            board.new_board(BOARD_RESET)
            output = Output.new(:board => board)
            expect do 
                output.board
            end.to output(" 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n").to_stdout
        end
    end

end