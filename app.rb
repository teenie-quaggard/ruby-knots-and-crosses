require_relative 'lib/game'
require_relative 'lib/output'
require_relative 'lib/player'
require_relative 'lib/board_constructor'
require_relative 'lib/tile'

board = BoardConstructor.new(:dimension => 3, :tile_length => 4)
board.create_board()
output = Output.new(:board => board.board_tiles)
game = Game.new(:output => output)
game.start_game()