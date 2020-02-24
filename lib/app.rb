require_relative 'play'
require_relative 'output'
require_relative 'board'

board = Board.new()
output = Output.new(:board => board)
play = Play.new(:output => output, :board => board)
play.start()