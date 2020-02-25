class Output

    attr_reader :board
    def initialize(args = {})
        @board = args[:board]
    end

    def get_input
        gets.chomp()
    end

    def intro
        hello
        prompt_turn
        board
    end

    def hello
        puts "Howdy stranger. Welcome to Noughts and Crosses."
    end

    def prompt_turn
        puts "\nChoose and number from 1-9:"
    end

    def board
        puts " #{@board.tiles[0]} | #{@board.tiles[1]} | #{@board.tiles[2]} \n-----------\n #{@board.tiles[3]} | #{@board.tiles[4]} | #{@board.tiles[5]} \n-----------\n #{@board.tiles[6]} | #{@board.tiles[7]} | #{@board.tiles[8]} \n"
    end
    
end