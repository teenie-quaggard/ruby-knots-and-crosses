require 'output'
require 'board'

RSpec.describe Output do
    describe "#intro" do
        it "prints intro using test double" do
            console = StringIO.new
            output = Output.new(:console => console)
            output.intro
            expect(console.string).to eq("\nHowdy stranger. Welcome to Noughts and Crosses.\n")
        end
    end

    describe "#get_input" do
        it "accepts input from a user" do
            console = StringIO.new "hello"
            output = Output.new(:console => console)
            output.get_input
            expect(console.string).to eq("hello")
        end
    end

    describe "#prompt_turn" do
        it "prints intro using test double" do
            console = StringIO.new
            output = Output.new(:console => console)
            output.prompt_turn
            expect(console.string).to eq("\n 👽Choose a number between 1-9: ")
        end
    end

    describe "#board" do
        it "prints board" do
            console = StringIO.new
            board = Board.new(:tiles => [1,2,3,4,5,6,7,8,9])
            output = Output.new(:console => console)
            output.print_board(board)
            expect(console.string).to eq("\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
        end
    end

end