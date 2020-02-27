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

    def start(player) 
        @output.intro
        tick(player)
        # @output.outro(@player.mark)
    end

    def winner(board, mark)
        tiles = board.tiles
        indices = tiles.each_index.select{|i| tiles[i] == mark}.sort()
        WINNING_INDICES.each {|winning_set| 
           return true if (winning_set - indices).empty?
        }
        false
    end
   
    def tie(board)
        tiles = board.tiles
        tiles.all? {|tile| tile.instance_of?(String)}
    end

    def game_over(player)
        (winner(@board, player.mark) || tie(@board))? true : false
    end

    def game_play(player)
        @output.print_board(@board)
        @output.prompt_turn
        user_input = @output.get_input()
        player.make_move(@board, player.mark, user_input)
    end

    def tick(player)
        game_play(player) while (game_over(player) == false)
        @output.print_board(@board)
    end
    

end