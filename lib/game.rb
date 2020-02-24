require_relative 'board_constructor'
require_relative 'player'
require_relative 'output'

class Game
  attr_accessor :board, :output, :player_1, :player_2

  def initialize (args = {})
    # @board = BoardConstructor.new(:dimension => 3, :tile_length => 4)
    # @output = Output.new(:board => @board.board_tiles)
    # @player_1 = Player.new(:mark => @output.MARK_1)
    # @player_2 = Player.new(:mark => @output.MARK_2)
    @board = args[:board]
    @output = args[:output]
    @player_1 = args[:player_1]
    @player_2 = args[:player_2]
  end

  def start_game()
    @output.welcome()
    @output.prints_empty_board(@output.board)
  end



end