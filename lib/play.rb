class Play

    WINNING_INDICES = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    attr_reader :board, :player1, :player2, :output
    def initialize(args)
        @board = args[:board]
        @player1 = args[:player1]
        @player2 = args[:player2]
        @output = args[:output]
    end

    def start 
        @output.intro
    end

    def winner(mark, board_spaces)
        indices = board_spaces.each_index.select{|i| board_spaces[i] == mark}
        WINNING_INDICES.include? indices
    end

    def tie(board_spaces)
        board_spaces.all? {|item| item.instance_of?(String)}
    end


    

end