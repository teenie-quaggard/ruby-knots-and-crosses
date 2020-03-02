class Board
    BOARD_RESET = {
        0 => nil,
        1 => nil,
        2 => nil,
        3 => nil,
        4 => nil,
        5 => nil,
        6 => nil,
        7 => nil,
        8 => nil
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
