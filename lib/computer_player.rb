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

  def find_empty_tiles(board)
    tiles = board.tiles
    empty_tiles = {}
    tiles.each { |key, value| 
      if value == nil
        empty_tiles[key] = value
      }
      end
    empty_tiles
  end
end