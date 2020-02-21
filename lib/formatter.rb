class Formatter
    attr_accessor :dimension, :row_length, :tile_content
    def initialize(args= {})
      @dimension = args[:dimension] || 3
      @tile_length = args[:tile_length] || 4 
      @tile_content = args[:tile_content] || ""
    end

    def format_tiles()
      tile_number = find_int_in_string(@tile_content)
      if (last_tile(tile_number))
        @tile_content
      elsif (last_column_tile(tile_number))
        @tile_content << "\n" << row_divider() << "\n"
      else
        @tile_content << "|"
      end
    end

    def last_tile(tile_number)
      true if tile_number == @dimension**2
    end

    def last_column_tile(tile_number)
      true if tile_number % @dimension == 0 && tile_number != @dimension**2
    end

    def find_int_in_string(string) 
      string.scan(/\d+/).map(&:to_i)[0]
    end

    def row_divider
      divider = ""
      length = row_length(@dimension, @tile_length)
      length.times{divider << "-"}
      return divider
    end

    def row_length(dimension, tile_length)
      (dimension * tile_length) + dimension + (dimension - 1)
    end

  end