# NAME_PROMPT = "Before we get started, what are your names? Please separate them with an ampersand and then click enter. For example, 'Little Boss & Big Boo'"
# # PLAYER_ONE = "Great, so who is going first? Enter your name. Your mark will be '#{starting_mark}'."
# # TURN_PROMPT = "#{name}, it's your turn!"
# # WINNER = "#{name}, great job! You win!"
# TIE = "Either you're both winners, or you're both losers - you decided."
# RESTART = "Would you like to play again? (Y/N)"
# # 

class Output

    MARK_1 = 'X'
    MARK_2 = 'O'
    WELCOME_MESSAGE = "Hello stranger. Let's play Noughts and Crosses. Would you like to review the rules of the game? (Y/N)" 
    GAME_RULES = "In this version of Noughts and Crosses, there are two players - that means you'll need a friend to play! Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin feugiat risus tellus, sed fermentum velit lobortis ac. Integer pretium metus diam, scelerisque malesuada lectus congue non. Quisque enim est, tempor quis diam ac, volutpat convallis velit. Morbi sodales tincidunt congue. Nullam volutpat congue libero, vel viverra turpis rhoncus at. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec ac enim sit amet magna luctus lobortis. Vivamus purus mauris, tempus non feugiat vitae, rhoncus ac orci. Curabitur eget volutpat ipsum."
    GET_STARTED = "Okay, let's play!"

    attr_accessor :board, :MARK_1, :MARK_2 
    def initialize(args={})
        @board = args[:board]
        @mark_1 = MARK_1 || 'X'
        @mark_2 = MARK_2 || 'O'
        @welcome_message = WELCOME_MESSAGE
        @game_rules = GAME_RULES
        @get_started = GET_STARTED
    end

    def output_message(message)
        puts message
    end

    def user_input
        gets.chomp
    end

    def welcome
        output_message(@welcome_message)
        input = user_input()
        rules() if input.capitalize == "Y"
        output_message(@get_started)
    end

    def rules 
        output_message(@game_rules)
    end

    def prints_empty_board(board)
        puts board
    end
end