class ComputerPlayer

  attr_reader :mark
  def initialize(args = {})
      @mark = args[:mark]
  end

  # - check for available spaces on Board
  # - chooses one randomly
  
  def get_input 
      # @console.print_board(@board)
      # @console.prompt_turn
      # user_input = @console.get_input
  end

  def make_move(board, mark, input)
      board.make_move(mark, input)
  end

end