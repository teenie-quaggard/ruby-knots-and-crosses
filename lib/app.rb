require_relative 'play'
require_relative 'output'
require_relative 'board'
require_relative 'player'

board = Board.new()
output = Output.new(:board => board)
player1 = Player.new(:mark => 'X')

play = Play.new(:output => output, :board => board, :player1 => player1)
play.start()