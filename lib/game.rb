
module Game
  WELCOME_MESSAGE = "Hello sunshine. Welcome to Noughts and Crosses! 
                    Would you like to know the rules of the game? Please type 'Y' or 'N' and click enter."
  GAME_RULES = "These are the rules of the game:"
  NAME_PROMPT = "Before we get started, what are your names? Please separate them with an ampersand and then click enter. For example, 'Little Boss & Big Boo'"
  # PLAYER_ONE = "Great, so who is going first? Enter your name. Your mark will be '#{starting_mark}'."
  # TURN_PROMPT = "#{name}, it's your turn!"
  # WINNER = "#{name}, great job! You win!"
  TIE = "Either you're both winners, or you're both losers - you decided."
  RESTART = "Would you like to play again? (Y/N)"

  class Output
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

  class Tile
    attr_accessor :tile_length
    def initialize(args = {})
      @tile_length = args[:tile_length] || 4
    end

    def create_empty_tile(tile_length)
      tile = ""
      tile_length.times{tile << " "}
      return tile
    end

    def populate_tile(empty_tile, tile_number)
      tile = empty_tile.insert(empty_tile.length/2, "#{tile_number}")
    end

    def tile
      empty_tile = create_empty_tile(@tile_length) 
      populate_tile(empty_tile)
    end
  end

  class Output
    def prints_empty_board(board)
      puts board
    end
  end

  class Formatter
    def find_int_in_string(string) 
      string.scan(/\d+/).map(&:to_i)[0]
    end

    def row_divider(row_length)
      divider = ""
      row_length.times{divider << "-"}
      return divider
    end

    def row_length(dimension, tile_length)
      (dimension * tile_length) + dimension + (dimension - 1)
    end
  end

  class BoardConstructor 
    attr_accessor :dimension, :tiles, :tile_length
    def initialize(args= {})
      @dimension = args[:dimension] || 3
      @single_tile = args[:tile]
      @tile_length = args[:tile_length] || 4 
      @tiles = board_spaces(@dimension)
      @row_length = row_length(@dimension, @tile_length)
    end

    def board_spaces(dimension)
      numbered_spaces = Array (1..dimension**2)
    end

    def create_board_tiles(spaces)
      spaces.map {|space_number| 
        single_tile = @single_tile.new(:tile_length => @tile_length)
      }
    end

    # TO do
    #   FORMAT TILeS
    # # format_tiles(single_tile)


    # def format_tiles(tile_string)
    #   piped_tile = ""
    #   tile_number = find_int_in_string(tile_string)
    #   if (tile_number % @dimension == 0 && tile_number != @tiles.length)
    #     return piped_tile << tile_string << "\n" << row_divider(@row_length) << "\n"
    #   elsif (tile_number == @tiles.length)
    #     piped_tile << tile_string
    #   else
    #     return piped_tile << tile_string << "|" 
    #   end
    # end


  end



end