class Output

    MARK_1 = 'X'
    MARK_2 = 'O'
    WELCOME_MESSAGE = "Hello stranger. Let's play Noughts and Crosses. Would you like to review the rules of the game? (Y/N)" 
    GAME_RULES = "In this version of Noughts and Crosses, there are two players - that means you'll need a friend to play! Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin feugiat risus tellus, sed fermentum velit lobortis ac. Integer pretium metus diam, scelerisque malesuada lectus congue non. Quisque enim est, tempor quis diam ac, volutpat convallis velit. Morbi sodales tincidunt congue. Nullam volutpat congue libero, vel viverra turpis rhoncus at. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec ac enim sit amet magna luctus lobortis. Vivamus purus mauris, tempus non feugiat vitae, rhoncus ac orci. Curabitur eget volutpat ipsum."
    GET_STARTED = "Okay, let's play!"
    PROMPTS_TURN = "Choose a number from 1-9."

    attr_accessor :board, :MARK_1, :MARK_2 
    def initialize(args={})
        @board = args[:board]
        @mark_1 = MARK_1 || 'X'
        @mark_2 = MARK_2 || 'O'
        @welcome_message = WELCOME_MESSAGE
        @game_rules = GAME_RULES
        @get_started = GET_STARTED
        @prompts_turn = PROMPTS_TURN
    end

    def output(message)
        puts message
    end

    def user_input
        gets.chomp
    end

    def welcome
        output(@welcome_message)
        input = user_input()
        output(@game_rules) if input.capitalize == "Y"
        output(@get_started)
        output(@prompts_turn)
    end


    def prints_board(board)
        puts board
    end

end