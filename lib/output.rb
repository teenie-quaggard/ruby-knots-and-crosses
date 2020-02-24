class Output

    attr_reader :board
    def initialize(args = {})
        @board = args[:board]
    end

    def hello
        puts "Howdy stranger. Welcome to Noughts and Crosses."
    end

    def board
        puts " #{@board.board_spaces[0]} | #{@board.board_spaces[1]} | #{@board.board_spaces[2]} \n-----------\n #{@board.board_spaces[3]} | #{@board.board_spaces[4]} | #{@board.board_spaces[5]} \n-----------\n #{@board.board_spaces[6]} | #{@board.board_spaces[7]} | #{@board.board_spaces[8]} \n"
    end
    
end