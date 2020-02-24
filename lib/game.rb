
class Game
  attr_accessor :board, :output, :player_1, :player_2

  def initialize (args = {})
    @board = args[:board]
    @output = args[:output]
    @player_1 = args[:player_1]
    @player_2 = args[:player_2]
  end

  def start_game
    @output.welcome()
    @output.prints_board(@output.board)
  end

  def make_move
    puts "BOoooooooard #{@board}"
  end

  # Create game loop
  # - User inputs move
  # - Check that move is valid (later)
  # - Place piece on board
  # - Check if winner / tie 
  # - Change turns





end