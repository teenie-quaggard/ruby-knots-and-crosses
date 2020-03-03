class Player

    attr_reader :mark
    def initialize(args = {})
        @mark = args[:mark]
    end

    def make_move(board, mark, user_input)
        puts "MARK FROM MAKE MOVE #{mark}"
        board.make_move(mark, user_input)
    end

end