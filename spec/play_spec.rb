require 'play'
require 'board'
require 'output'
require 'player'

RSpec.describe Play do

    # describe "#start" do
    #     it 'prints intro to game' do
    #         board = Board.new
    #         output = Output.new
    #         player = Player.new(:mark => 'X')
    #         game = Play.new(:board => board, :output => output, :player => player)
            
    #         expect do
    #             game.start
    #           end.to output(/Howdy stranger. Welcome to Noughts and Crosses.\n/).to_stdout
    #     end
    # end

    it '#winner returns true when there is a winner' do
        board = Board.new(:tiles => ["X","X","X","O",5,"O",7,8,"O"])
        output = Output.new
        player = Player.new(:mark => 'X')
        game = Play.new(:board => board, :output => output, :player => player)

        expect(game.winner(game.board, player.mark)).to eq(true)
    end

    it '#winner returns false when there is not a winner' do
        board = Board.new(:tiles => ["X","X","X","O",5,"O",7,8,"O"])
        output = Output.new
        game = Play.new(:board => board, :output => output)
        player = Player.new(:mark => 'O')
        expect(game.winner(game.board, player.mark)).to eq(false)
    end

    it '#tie returns true when there is a tie' do
        board = Board.new(:tiles => ["X","O","O","O","X","X","X","X","O"])
        output = Output.new
        player = Player.new(:mark => 'X')
        game = Play.new(:board => board, :output => output, :player => player)
        expect(game.tie(game.board)).to eq(true)
    end

    it '#tie returns false when the game is not over' do
        board = Board.new(:tiles => ["X","O","O","O","X","X","X","X",9])
        output = Output.new
        player = Player.new(:mark => 'X')
        game = Play.new(:board => board, :output => output, :player => player)
        expect(game.tie(game.board)).to eq(false)
    end

    it '#game_over returns true if there is a tie' do
        tie_board = Board.new(:tiles => ["X","O","O","O","X","X","X","X","O"])
        output = Output.new
        players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
        current_player = players[0]
        game = Play.new(:board => tie_board, :output => output, :players => players, :current_player => current_player)
        expect(game.game_over()).to eq(true)
    end

    it '#game_over returns true if there is a winner' do
        winning_board = Board.new(:tiles => ["X","X","X","O",5,"O",7,8,"O"])
        output = Output.new
        players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
        current_player = players[0]
        game = Play.new(:board => winning_board, :output => output, :players => players, :current_player => current_player)
        expect(game.game_over()).to eq(true)
    end

    it '#game_over returns false if there not a tie or a winner' do
        board = Board.new(:tiles => [1,2,3,4,5,6,7,8,9])
        output = Output.new
        players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
        current_player = players[0]
        game = Play.new(:board => board, :output => output, :players => players, :current_player => current_player)
        expect(game.game_over()).to eq(false)
    end

    it '#toggle_player changes the current player instance variable' do
        board = Board.new(:tiles => [1,2,3,4,5,6,7,8,9])
        output = Output.new
        players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
        current_player = players[0]
        game = Play.new(:board => board, :output => output, :players => players, :current_player => current_player)
        expect(game.current_player.mark).to eq(players[0].mark)
    end



    # it '#tick checks for end of game. If not, prompts another turn.' do
    #     board = Board.new(:tiles => ["X","X",3,"O","O",6,7,8,"O"])
    #     console = StringIO.new
    #     allow($stdin).to receive(:gets).and_return("3")
    #     $stdout = StringIO.new
    #     output = Output.new(:console => console)

    #     player = Player.new(:mark => 'X')
    #     game = Play.new(:board => board, :output => output, :player => player)
    #     game.tick(game.board, game.player)
    #     output = $stdout.string 
    #     expect(output).to include("WINNER")

    # end

end