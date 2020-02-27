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

    # def outro(player)
    #     @console.print "😎  Player #{player} wins! Would you like to play again? (Y/N): "
    #     input = get_input().capitalize
    #     @console.puts "Alright, see you next time! 👋" if (input == "N") 
    # end

    def prompt_turn
        @console.print "\nChoose a number between 1-9: "
    end

    def print_board(board)
        @console.puts "\n\n #{board.tiles[0]} | #{board.tiles[1]} | #{board.tiles[2]} \n-----------\n #{board.tiles[3]} | #{board.tiles[4]} | #{board.tiles[5]} \n-----------\n #{board.tiles[6]} | #{board.tiles[7]} | #{board.tiles[8]} \n"
    end
    
end