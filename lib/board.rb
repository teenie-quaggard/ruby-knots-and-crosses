class Board
    BOARD_RESET = {
        0 => 1,
        1 => 2,
        2 => 3,
        3 => 4,
        4 => 5,
        5 => 6,
        6 => 7,
        7 => 8,
        8 => 9
    }

    attr_reader :tiles
    def initialize(args = {})
        @tiles = args[:tiles] || BOARD_RESET
    end

    def make_move(mark, user_input)
        digit = user_input.to_i
        index = digit - 1
        @tiles[index] = mark
    end

    def tile_content(input)
        index = input-1
        @tiles[index]
    end

end
