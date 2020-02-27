require_relative 'play'
require_relative 'output'
require_relative 'board'
require_relative 'player'

board = Board.new()
output = Output.new()
player1 = Player.new(:mark => 'X')
player2 = Player.new(:mark => 'O')

play = Play.new(:output => output, :board => board, :player1 => player1, :player2 => player2)
play.start(player1)