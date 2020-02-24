class Board
    BOARD_RESET = [1,2,3,4,5,6,7,8,9]

    attr_reader :board_spaces
    def initialize(args = {})
        @board_spaces = args[:board_spaces] || BOARD_RESET
    end

    def new_board(reset_array)
        @board_spaces = reset_array
    end



end
