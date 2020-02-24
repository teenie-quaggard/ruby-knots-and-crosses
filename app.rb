require_relative 'lib/board_constructor'
require_relative 'lib/tile'
require_relative 'lib/output'
require_relative 'lib/player'
require_relative 'lib/game'

board = BoardConstructor.new(:dimension => 3, :tile_length => 4)
board.create_board()

output = Output.new(:board => board.board_tiles)
player1 = Player.new(:mark => output.MARK_1)
game = Game.new(:output => output, :board => board.board_tiles)
game.start_game()