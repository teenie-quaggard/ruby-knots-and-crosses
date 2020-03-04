require 'console'
require 'board'

RSpec.describe Console do
    describe "#intro" do
        it "prints intro using test double" do
            output = StringIO.new 
            console = Console.new(:output => output, :input => StringIO.new)
            console.intro
            expect(output.string).to eq("\nHowdy stranger. Welcome to Noughts and Crosses.")
        end
    end

    describe "#get_input" do
        it "accepts input from a user" do
            input = StringIO.new "hello"
            console = Console.new(:input => input, :output => StringIO.new)
            console.get_input
            expect(input.string).to eq("hello")
        end
    end

    describe "#spot_taken" do
        it "prints intro using test double" do
            output = StringIO.new
            console = Console.new(:output => output, :input => StringIO.new)
            console.spot_taken
            expect(output.string).to eq("Sorry, choose another spot! This spot is taken!\n")
        end
    end

    describe "#bad_input" do
        it "prints intro using test double" do
            output = StringIO.new
            console = Console.new(:output => output, :input => StringIO.new)
            console.bad_input
            expect(output.string).to eq("Something was wrong with your input! Make sure it is an integer within the board limits.\n")
        end
    end

    describe "#prompt_turn" do
        it "prints intro using test double" do
            output = StringIO.new
            console = Console.new(:output => output, :input => StringIO.new)
            console.prompt_turn
            expect(output.string).to eq("\n 👆 👆 👆  Choose a number between 1-9: ")
        end
    end

    describe "#board" do
        it "prints board" do
            output = StringIO.new
            board = Board.new
            console = Console.new(:output => output, :input => StringIO.new)
            console.print_board(board)
            expect(output.string).to eq("\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
        end
    end

end