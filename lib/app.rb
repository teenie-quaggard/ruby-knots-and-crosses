require_relative 'play'
require_relative 'console'
require_relative 'board'
require_relative 'player'

board = Board.new
console = Console.new
player1 = Player.new(:mark => 'X')
player2 = Player.new(:mark => 'O')
players = [player1, player2]

play = Play.new(:console => console, :board => board, :players => players, :current_player => players[0])
play.start