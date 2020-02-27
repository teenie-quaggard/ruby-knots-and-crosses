class Output

    attr_reader :console

    def initialize(args = {})
        @console = args[:console] || Kernel
    end

    def get_input
        @console.gets.chomp()
    end

    def intro
        @console.puts "\nHowdy stranger. Welcome to Noughts and Crosses.\n"
    end

    def outro
        @console.print "Would you like to play again? (Y/N): "
        input = get_input().capitalize
        if (input == "N")
            @console.puts "Alright, see you next time! 👋"
        else
            @console.puts "Sorry, I'm just not that advanced. 👋"
        end
    end

    def prompt_turn
        @console.print "\n 👽Choose a number between 1-9: "
    end

    def winner(player)
        @console.puts "\nPlayer #{player} wins!😎\n"
    end

    def tie
        @console.puts "\nIt's a tie!🙈\n"
    end

    def print_board(board)
        @console.puts "\n #{board.tiles[0]} | #{board.tiles[1]} | #{board.tiles[2]} \n-----------\n #{board.tiles[3]} | #{board.tiles[4]} | #{board.tiles[5]} \n-----------\n #{board.tiles[6]} | #{board.tiles[7]} | #{board.tiles[8]} \n"
    end
    
end