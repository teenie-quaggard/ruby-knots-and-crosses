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

    def user_move 
        @console.print_board(@board)
        @console.prompt_turn
        user_input = @console.get_input()
        move = @current_player.make_move(@board, @current_player.mark, user_input)
    end

    def turn
        move = user_move
        validation = validate(user_move)
        if (validation == true)
            game_over ? @console.print_board(@board) : toggle_player
        end
    end

    def validate(move)
        if move == "Spot taken"
            @console.spot_taken
            turn
        elsif move == "Bad input"
            @console.bad_input
            turn
        else
            true
        end
    end 
    
    def toggle_player
        @current_player == @players[0] ? @current_player = @players[1] : @current_player = @players[0]
    end 

end