require 'player'

RSpec.describe Player do

  it '#make_move places marker on tile' do
    board = Board.new()
    console = Console.new(:output=> StringIO.new, :input => StringIO.new)
    players = [Player.new(:mark => 'X'), Player.new(:mark => 'O') ]
    current_player = players[0]
    game = Play.new(:board => board, :console => console, :players => players, :current_player => current_player)
    user_input = 9
    game.current_player.make_move(game.board, current_player.mark, user_input)
    expect(game.board.tile_content(9)).to eq("X")
  end
 
end
