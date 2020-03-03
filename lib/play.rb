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

    attr_reader :board, :console, :players, :current_player
    def initialize(args)
        @board = args[:board] 
        @players = args[:players]
        @current_player = args[:current_player]
        @console = args[:console]
    end

    def start
        @console.intro
        tick
        @console.outro
    end

    def tick
        turn while (game_over == false)
    end

    def turn
        move = user_moves
        validation = validate_user_move(move)
        if validation == true
            @current_player.make_move(@board, @current_player.mark, move)
            game_over ? @console.print_board(@board) : toggle_player
        else
            turn
        end
    end

    def user_moves 
        @console.print_board(@board)
        @console.prompt_turn
        user_input = @console.get_input
    end

    def validate_user_move(input)
        board_validation = @board.validate(input)
        if board_validation == "Spot taken"
            @console.spot_taken
        elsif board_validation == "Bad input"
            @console.bad_input
        else    
            true
        end
    end


    def game_over
        if (winner(@board, @current_player.mark) == true )
            @console.winner(@current_player.mark)
            return true
        elsif (tie(@board) == true)
            @console.tie
            return true
        else
            false
        end
    end

    def winner(board, mark)
        tiles = board.tiles
        indices = tiles.each_key.select{|i| tiles[i] == mark}.sort()
        WINNING_INDICES.each {|winning_set| 
           return true if (winning_set - indices).empty?
        }
        false
    end
   
    def tie(board)
        tiles = board.tiles
        tiles.all? {|key, value| value.instance_of?(String)}
    end

    def toggle_player
        @current_player == @players[0] ? @current_player = @players[1] : @current_player = @players[0]
    end 

end