class Player

    attr_reader :mark
    def initialize(args = {})
        @mark = args[:mark]
    end

    def make_move(board, mark, user_input)
        puts "It's my turn: #{mark}"
        board.make_move(mark, user_input)
    end

end