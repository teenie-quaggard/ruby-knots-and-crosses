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

    attr_reader :board, :player, :output
    def initialize(args)
        @board = args[:board]
        @player = args[:player]
        @output = args[:output]
        @playing = false
    end

    def start 
        @output.intro
        # tick(@board, @player)
    end

    def make_move(board, mark, user_input)
        board.make_move(mark, user_input)
    end

    def winner(board, mark)
        tiles = board.tiles
        indices = tiles.each_index.select{|i| tiles[i] == mark}
        WINNING_INDICES.include? indices
    end

    def tie(board)
        tiles = board.tiles
        tiles.all? {|tile| tile.instance_of?(String)}
    end

    def game_over(winner_method, tie_method)
        if (winner_method || tie_method)
            true
        else
            false
        end
    end

    def game_play()
        @output.prompt_turn
        @output.print_board(board)
        user_input = gets.chomp()
        make_move(board, player.mark, user_input)
    end


    # def tick(board, player)
    #     # if (winner(board, player))
    #     #     puts "#{player} wins!"
    #     # elsif (tie(board))
    #     #     puts "It's a tie."
    #     # else
    #     #     @output.prompt_turn
    #     #     @output.print_board(board)
    #     #     user_input = gets.chomp()
    #     #     make_move(board, player.mark, user_input)
    #     #     @output.print_board(board)
    #     # end
    #     while (game_over(winner(board, player), tie(board)) == false)
    #         game_play()
    #     end
    #     # @playing = false
    #     puts 'WINNER'
    # end
    

end