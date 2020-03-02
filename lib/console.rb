class Console

    attr_reader :console

    def initialize(args = {})
        @output = args[:output] || Kernel
        @input = args[:input] || Kernel
    end

    def get_input
        @input.gets.chomp()
    end

    def intro
        @output.puts "\nHowdy stranger. Welcome to Noughts and Crosses.\n"
    end

    def outro
        @output.print "Would you like to play again? (Y/N): "
        input = get_input().capitalize
        if (input == "N")
            @output.puts "Alright, see you next time! 👋"
        else
            @output.puts "Sorry, I'm just not that advanced. 👋"
        end
    end

    def prompt_turn
        @output.print "\n 👽Choose a number between 1-9: "
    end

    def winner(player)
        @output.puts "\nPlayer #{player} wins!😎\n"
    end

    def tie
        @output.puts "\nIt's a tie!🙈\n"
    end

    def print_board(board)
        @output.puts "\n #{board.tiles[0]} | #{board.tiles[1]} | #{board.tiles[2]} \n-----------\n #{board.tiles[3]} | #{board.tiles[4]} | #{board.tiles[5]} \n-----------\n #{board.tiles[6]} | #{board.tiles[7]} | #{board.tiles[8]} \n"
    end
    
end