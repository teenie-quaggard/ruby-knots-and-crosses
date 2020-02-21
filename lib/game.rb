
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
# 



  class Output
    attr_accessor :board
    def initialize(args={})
      @board = args[:board]
    end

    def prints_empty_board
      puts @board
    end
  end

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
      tiles = create_board_tiles(@spaces, Game::Formatter)
      @board_tiles = tiles.reduce(:+)
    end

  end

end