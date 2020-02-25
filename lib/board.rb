class Board
    BOARD_RESET = [1,2,3,4,5,6,7,8,9]

    attr_reader :tiles
    def initialize(args = {})
        @tiles = args[:tiles] || BOARD_RESET
    end

    def make_move(mark, user_input)
        index = user_input - 1
        @tiles[index] = mark
    end

    def new_board(reset_array)
        @tiles = reset_array
    end



end
