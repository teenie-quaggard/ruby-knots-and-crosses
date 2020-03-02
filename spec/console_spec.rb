require 'console'
require 'board'

RSpec.describe Console do
    describe "#intro" do
        it "prints intro using test double" do
            output = StringIO.new
            console = Console.new(:output => output)
            console.intro
            expect(output.string).to eq("\nHowdy stranger. Welcome to Noughts and Crosses.\n")
        end
    end

    describe "#get_input" do
        it "accepts input from a user" do
            input = StringIO.new "hello"
            console = Console.new(:input => input)
            console.get_input
            expect(input.string).to eq("hello")
        end
    end

    describe "#prompt_turn" do
        it "prints intro using test double" do
            output = StringIO.new
            console = Console.new(:output => output)
            console.prompt_turn
            expect(output.string).to eq("\n 👽Choose a number between 1-9: ")
        end
    end

    describe "#board" do
        it "prints board" do
            output = StringIO.new
            board = Board.new(:tiles => [1,2,3,4,5,6,7,8,9])
            console = Console.new(:output => output)
            console.print_board(board)
            expect(output.string).to eq("\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
        end
    end

end