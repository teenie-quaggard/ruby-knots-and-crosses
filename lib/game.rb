
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

  class BoardConstructor 
    attr_accessor :dimension, :tiles, :tiles_length
    def initialize(args)
      @dimension = args[:dimension] || 3
      @tile_length = args[:tile_length] || 4
      @tiles = create_array_of_tiles(@dimension)
      @row_length = row_length(@dimension, @tile_length)
    end

    def prints_board(tiles)
      puts create_board_tiles(tiles).reduce(:+)
    end

    def create_array_of_tiles(dimension)
      array_of_tiles = Array (1..dimension**2)
    end

    def row_length(dimension, tile_length)
      (dimension * tile_length) + dimension + (dimension - 1)
    end

    def create_board_tiles(tiles)
      tiles.map {|tile_number| 
        populated_tile = populate_tile(tile_number)
        format_tiles(populated_tile)
      }
    end

    def populate_tile(tile_number)
      empty_tile = create_empty_tile(@tile_length)
      tile = empty_tile.insert(empty_tile.length/2, "#{tile_number}")
    end

    def format_tiles(tile_string)
      piped_tile = ""
      tile_number = find_int_in_string(tile_string)
      if (tile_number % @dimension == 0 && tile_number != @tiles.length)
        return piped_tile << tile_string << "\n" << row_divider(@row_length) << "\n"
      elsif (tile_number == @tiles.length)
        piped_tile << tile_string
      else
        return piped_tile << tile_string << "|" 
      end
    end

    def find_int_in_string(string) 
      string.scan(/\d+/).map(&:to_i)[0]
    end

    def create_empty_tile(tile_length)
      tile = ""
      tile_length.times{tile << " "}
      return tile
    end

    def row_divider(row_length)
      divider = ""
      row_length.times{divider << "-"}
      return divider
    end

  end
end