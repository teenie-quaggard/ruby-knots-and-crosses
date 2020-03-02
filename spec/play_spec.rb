require 'play'
require 'board'
require 'console'
require 'player'

RSpec.describe Play do

    # describe "#start" do
    #     it 'prints intro to game' do
    #         board = Board.new
    #         console = Console.new
    #         player = Player.new(:mark => 'X')
    #         game = Play.new(:board => board, :console => console, :player => player)
            
    #         expect do
    #             game.start
    #           end.to console(/Howdy stranger. Welcome to Noughts and Crosses.\n/).to_stdout
    #     end
    # end

    it '#winner returns true when there is a winner' do
        board = Board.new(:tiles => {0=>"X", 1=>"X", 2=>"X", 3=>4, 4=>5, 5=>6, 6=>7, 7=>8, 8=>9})
        console = Console.new
        player = Player.new(:mark => 'X')
        game = Play.new(:board => board, :console => console, :player => player)

        expect(game.winner(game.board, player.mark)).to eq(true)
    end

    it '#winner returns false when there is not a winner' do
        board = Board.new(:tiles => {0=>"X", 1=>"X", 2=>"X", 3=>4, 4=>5, 5=>6, 6=>7, 7=>8, 8=>9})
        console = Console.new
        game = Play.new(:board => board, :console => console)
        player = Player.new(:mark => 'O')
        expect(game.winner(game.board, player.mark)).to eq(false)
    end

    it '#tie returns true when there is a tie' do
        board = Board.new(:tiles => {0=>"X", 1=>"O", 2=>"O", 3=>"O", 4=>"X", 5=>"X", 6=>"X", 7=>"X", 8=>"O"})
        console = Console.new
        player = Player.new(:mark => 'X')
        game = Play.new(:board => board, :console => console, :player => player)
        expect(game.tie(game.board)).to eq(true)
    end

    it '#tie returns false when the game is not over' do
        board = Board.new(:tiles =>  {0=>"X", 1=>"O", 2=>"O", 3=>"O", 4=>"X", 5=>"X", 6=>"X", 7=>"X", 8=>9})
        console = Console.new
        player = Player.new(:mark => 'X')
        game = Play.new(:board => board, :console => console, :player => player)
        expect(game.tie(game.board)).to eq(false)
    end

    it '#game_over returns true if there is a tie' do
        tie_board = Board.new(:tiles => {0=>"X", 1=>"O", 2=>"O", 3=>"O", 4=>"X", 5=>"X", 6=>"X", 7=>"X", 8=>"O"})
        console = Console.new
        players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
        current_player = players[0]
        game = Play.new(:board => tie_board, :console => console, :players => players, :current_player => current_player)
        expect(game.game_over()).to eq(true)
    end

    it '#game_over returns true if there is a winner' do
        winning_board = Board.new(:tiles => {0=>"X", 1=>"X", 2=>"X", 3=>4, 4=>5, 5=>6, 6=>7, 7=>8, 8=>9})
        console = Console.new
        players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
        current_player = players[0]
        game = Play.new(:board => winning_board, :console => console, :players => players, :current_player => current_player)
        expect(game.game_over()).to eq(true)
    end

    it '#game_over returns false if there not a tie or a winner' do
        board = Board.new(:tiles => {0=>"X", 1=>"X", 2=>3, 3=>4, 4=>5, 5=>6, 6=>7, 7=>8, 8=>9})
        console = Console.new
        players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
        current_player = players[0]
        game = Play.new(:board => board, :console => console, :players => players, :current_player => current_player)
        expect(game.game_over()).to eq(false)
    end

    it '#toggle_player changes the current player instance variable' do
        board = Board.new()
        console = Console.new
        players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
        current_player = players[0]
        game = Play.new(:board => board, :console => console, :players => players, :current_player => current_player)
        game.toggle_player
        expect(game.current_player.mark).to eq(players[1].mark)
    end

    # it '#turn' do
    #     board = Board.new()
    #     input = StringIO.new "2\n"
    #     console = Console.new(:input => input)
    #     players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
    #     game = Play.new(:board => board, :console => console, :players => players, :current_player => players[0])
    #     game.turn
    #     expect(board).to eq({0=>1, 1=>"X", 2=>3, 3=>4, 4=>5, 5=>6, 6=>7, 7=>8, 8=>9})
    #     # // expect that board has been updated with appropriate marker
    # end



    # it '#tick checks for end of game. If not, prompts another turn.' do
    #     board = Board.new(:tiles => ["X","X",3,"O","O",6,7,8,"O"])
    #     console = StringIO.new
    #     allow($stdin).to receive(:gets).and_return("3")
    #     $stdout = StringIO.new
    #     console = Console.new(:console => console)

    #     player = Player.new(:mark => 'X')
    #     game = Play.new(:board => board, :console => console, :player => player)
    #     game.tick(game.board, game.player)
    #     console = $stdout.string 
    #     expect(console).to include("WINNER")

    # end

end