require 'game_constructor'
require 'console'
require 'board'
require 'player'



RSpec.describe GameConstructor do

  it "#game_type allows you to play the game with either one or two human players" do
   
  end
  
  it "#two_player_game creates a new instance of the Play class" do
    console = Console.new(:output => StringIO.new, :input => StringIO.new)
    constructor = GameConstructor.new(:console => console)
    board = Board.new
    expect(constructor.two_player_game(board)).to be_an_instance_of(Play)
  end

  it '#go ends game if player inputs "N" after game play' do 
    output = StringIO.new
    input = StringIO.new "1\n2\n5\n3\n9\nN\n"
    console = Console.new(:output => output, :input => input)
    constructor = GameConstructor.new(:console => console)
    board = Board.new
    constructor.go(board)
    expect(output.string).to include("Alright, see you next time! 👋")
  end

end