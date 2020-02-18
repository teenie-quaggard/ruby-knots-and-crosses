
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
    attr_accessor :dimension
    def initialize(dimension = 3)
      @dimension = dimension
    end
  end
end