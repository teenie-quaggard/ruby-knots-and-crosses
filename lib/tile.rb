class Tile
    attr_accessor :tile_length, :tile_content, :space_number
    def initialize(args = {})
      @tile_length = args[:tile_length] || 4
      @space_number = args[:space_number] 
      @tile_content = args[:tile_content] 
    end

    def tile
      empty_tile = create_empty_tile(@tile_length) 
      populate_tile(empty_tile, @space_number)
    end

    def create_empty_tile(tile_length)
      tile = ""
      tile_length.times{tile << " "}
      return tile
    end

    def populate_tile(empty_tile, space_number)
      @tile_content = empty_tile.insert(empty_tile.length/2, "#{space_number}")
    end

  end