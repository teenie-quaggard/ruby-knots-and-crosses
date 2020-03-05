class ComputerPlayer

  attr_reader :mark, :console
  def initialize(args = {})
      @mark = args[:mark]
  end

  # - check for available spaces on Board
  # - chooses one randomly

  # def get_input(board) 
  #   find_empty_tiles(board)

  # end

  def make_move(board, mark, input)
      board.make_move(mark, input)
  end

  # def find_empty_tiles(board)
  #   empty_tiles = {}
  #   board.tiles.each { |key, value| 
  #     empty_tiles[key] = value if value == nil
  #   }
  #   empty_tiles
  # end

end