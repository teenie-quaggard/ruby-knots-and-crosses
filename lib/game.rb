
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
    attr_accessor :dimension, :squares
    def initialize(dimension = 3)
      @dimension = dimension
      @squares = create_grid(@dimension)
    end

    def create_grid(dimension)
      Array (1..dimension**2)
    end

    def prints_board(squares)
      puts "  
          1  |  2  |  3  
        -----------------      
          4  |  5  |  6  
        -----------------   
          7  |  8  |  9  "
    end
  end
end