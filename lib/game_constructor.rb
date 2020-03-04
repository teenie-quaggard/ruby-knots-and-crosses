require_relative 'play'
require_relative 'board'
require_relative 'player'

class GameConstructor 
  
  attr_reader :console
  def initialize(args={})
    @console = args[:console]
  end

  def go(board=Board.new)
    game = new_human_game(board)
    @console.intro
    game.tick while game.end == false
    restart?
  end

  def restart?
    play_again = @console.outro
    play_again == "N" ? @console.bye : go
  end

  def new_human_game(board=Board.new)
    players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
    Play.new(:console => @console, :board => board, :players => players, :current_player => players[0])
  end

end