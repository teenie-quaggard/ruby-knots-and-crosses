require_relative 'play'
require_relative 'output'
require_relative 'board'

play = Play.new(:output => Output.new, :board => Board.new)
play.start()