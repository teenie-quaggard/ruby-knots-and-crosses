require 'board_constructor'
require 'player'
require 'output'

class Game
  attr_accessor 

  def initialize
    @board = BoardConstructor.new(:dimension => 3, :tile_length => 4)
    @output = Output.new()
    @player_1 = Player.new(:mark => output.mark_1)
    @player_2 = Player.new(:mark => output.mark_2)

  end

  def start_game

  end



end