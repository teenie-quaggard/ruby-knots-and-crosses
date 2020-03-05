class Player

    attr_reader :mark, :console
    def initialize(args = {})
        @mark = args[:mark]
        @console = args[:console]
    end

    def get_input (board)
        @console.print_board(board)
        @console.prompt_turn
        @console.get_input
    end

    def make_move(board, mark, input)
        board.make_move(mark, input)
    end

end