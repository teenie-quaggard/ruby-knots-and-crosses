require 'game_constructor'
require 'console'
require 'board'
require 'player'



RSpec.describe GameConstructor do

  it "#human_game creates a new instance of the Play class" do
    constructor = GameConstructor.new
    board = Board.new
    console = Console.new(:output => StringIO.new, :input => StringIO.new)
    expect(constructor.new_human_game(board, console)).to be_an_instance_of(Play)
  end

  it '#go ends game if player inputs "N" after game play' do 
    constructor = GameConstructor.new
    board = Board.new
    output = StringIO.new "\nHowdy stranger. Welcome to Noughts and Crosses.\n"
    input = StringIO.new "1\n2\n5\n3\n9\nN\n"
    console = Console.new(:output => output, :input => input)
    constructor.go(board, console)
    expect(output.string).to include("Alright, see you next time! 👋")
  end

  # it "#program_loop creates a new instance of the Play class" do
  #   constructor = GameConstructor.new
  #   board = Board.new
  #   output = StringIO.new "\nHowdy stranger. Welcome to Noughts and Crosses.\n"
  #   input = StringIO.new "1\n2\n5\n3\n9\n"
  #   console = Console.new(:output => output, :input => input)
  #   constructor.program_loop(board, console)
  #   expect(output.string).to eq("\\nHowdy stranger. Welcome to Noughts and Crosses.\n")
  # end

#   describe "#prompt_turn" do
#     it "prints intro using test double" do
#         output = StringIO.new
#         console = Console.new(:output => output, :input => StringIO.new)
#         console.prompt_turn
#         expect(output.string).to eq("\n 👆 👆 👆  Choose a number between 1-9: ")
#     end
# end



end