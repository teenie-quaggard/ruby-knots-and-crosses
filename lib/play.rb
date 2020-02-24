class Play

    attr_reader :board, :player1, :player2, :output
    def initialize(args)
        @board = args[:board]
        @player1 = args[:player1]
        @player2 = args[:player2]
        @output = args[:output]
    end

    def start 
        @output.hello
        @output.prompt_turn
        @output.board
        # @output.get_input
    end

end