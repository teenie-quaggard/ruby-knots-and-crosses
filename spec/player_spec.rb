require 'player'

RSpec.describe Player do

  it '#make_move places marker on tile' do
    board = Board.new(:tiles => [1,2,3,4,5,6,7,8,9])
    output = Output.new
    player = Player.new(:mark => 'X')
    game = Play.new(:board => board, :output => output, :player => player)
    user_input = 3
    player.make_move(game.board, player.mark, user_input)
    expect(game.board.tiles).to eq([1,2,'X',4,5,6,7,8,9])
  end
 
end
