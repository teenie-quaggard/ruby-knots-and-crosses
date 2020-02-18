
module Game
  WELCOME_MESSAGE = "Hello sunshine. Welcome to Noughts and Crosses."
  GAME_RULES = "These are the rules of the game:"

  class Display
    def self.prints_message(msg)
      puts msg
    end
  end

  class Player
    attr_accessor :mark, :name
    def initialize(mark, name)
      @mark = mark
      @name = name
    end
  end

  class Board 
    attr_accessor :dimension, :tiles, :tiles_length
    def initialize(args)
      @dimension = args[:dimension] || 3
      # @tile_length = tile_length
      # @tiles = create_board_array(@dimension)
      # @row_length = find_row_length(@dimension)
    end

    def create_array_of_tiles(dimension)
      Array (1..dimension**2)
    end

    # def prints_board(tile)
    #   puts "  
    #       1  |  2  |  3  
    #     -----------------      
    #       4  |  5  |  6  
    #     -----------------   
    #       7  |  8  |  9  "
    # end

    # def prints_board(tile)
    #   tile.each { |n| print "  #{n}  |" }
    # end

    # def row_divider(row_length)
    #   row_length.times{print '-'}
    # end

    # def find_row_length(dimension, tile_length)
    #   (dimension * tile_length) + (dimension - 1)
    # end

    # def tile_length(number)

    # end
  end
end