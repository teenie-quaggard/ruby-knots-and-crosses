require 'formatter'

class BoardConstructor 
    attr_accessor :dimension, :spaces, :single_tile, :tile_length, :board_tiles
    def initialize(args = {})
      @dimension = args[:dimension] || 3
      @spaces = args[:spaces] || [1,2,3,4,5,6,7,8,9]
      @tile_length = args[:tile_length] || 4 
      @single_tile = args[:single_tile]
      @board_tiles = args[:board_tiles] || ""
    end

    def board_spaces(dimension)
      numbered_spaces = Array (1..dimension**2)
    end

    def create_board_tiles(spaces, formatter)
      tiles = spaces.map {|space_number| 
        single_tile = @single_tile.new(:space_number => space_number, :tile_length => @tile_length)
        formatted_tile = formatter.new(:dimension => @dimension, :tile_length => @tile_length, :tile_content => single_tile.tile).format_tiles()
      }
    end

    def create_board
      tiles = create_board_tiles(@spaces, Formatter)
      @board_tiles = tiles.reduce(:+)
    end

  end