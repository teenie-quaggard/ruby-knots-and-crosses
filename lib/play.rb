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

    attr_reader :board, :player1, :output
    def initialize(args)
        @board = args[:board]
        @player1 = args[:player1]
        @output = args[:output]
    end

    def start 
        @output.intro
    end

    def make_move(board, mark, user_input)
        board.make_move(mark, user_input)
    end

    def winner(tiles, mark)
        indices = tiles.each_index.select{|i| tiles[i] == mark}
        WINNING_INDICES.include? indices
    end

    def tie(tiles)
        tiles.all? {|tile| tile.instance_of?(String)}
    end

    def game_loop(board)
        if (winner(board, mark))
            puts "#{mark} wins!"
        elsif (tie(board))
            puts "It's a tie."
        else
            make_move(board, mark)
        end
    end
    

end