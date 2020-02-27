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

    attr_reader :board, :output, :players, :current_player
    def initialize(args)
        @board = args[:board] 
        @players = args[:players]
        @current_player = args[:current_player]
        @output = args[:output]
    end

    def start
        @output.intro
        tick
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

    def game_over
        (winner(@board, @current_player.mark) || tie(@board))? true : false
    end

    def game_play
        @output.print_board(@board)
        @output.prompt_turn
        user_input = @output.get_input()
        @current_player.make_move(@board, @current_player.mark, user_input)
    end

    def tick
        game_play() while (game_over() == false)
        @output.print_board(@board)
    end
    
    def toggle_player
        if (@current_player == @players[0])
            @current_player = @players[1]
        else
            @current_player = @players[0]
        end
    end 

end