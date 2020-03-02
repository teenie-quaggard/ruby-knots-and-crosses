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

    def make_move(mark, input)
        index = find_index(input)
        @tiles[index] = mark
    end

    def tile_content(input)
        index = find_index(input)
        @tiles[index]
    end

    def find_index(input)
        digit = input.to_i
        index = digit - 1
    end

end
