require 'play'
require 'board'
require 'output'
require 'player'

RSpec.describe Play do

    describe "#start" do
        it 'prints intro to game' do
            board = Board.new
            output = Output.new
            player = Player.new(:mark => 'X')
            game = Play.new(:board => board, :output => output, :player => player)
            
            expect do
                game.start
              end.to output(/Howdy stranger. Welcome to Noughts and Crosses.\n/).to_stdout
        end

        # it 'prints a new board' do
        #     board = Board.new
        #     output = Output.new
        #     game = Play.new(:board => board, :output => output)
            
        #     expect do
        #         game.start
        #       end.to output(/ 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n/).to_stdout
        # end

        # it 'prompts user to input a number' do
        #     board = Board.new
        #     output = Output.new
        #     game = Play.new(:board => board, :output => output)
            
        #     expect do
        #         game.start
        #       end.to output(/Choose and number from 1-9:\n/).to_stdout
        # end
    end

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
        game = Play.new(:board => board, :output => output)
        expect(game.tie(game.board)).to eq(true)
    end

    it '#tie returns false when the game is not over' do
        board = Board.new(:tiles => ["X","O","O","O","X","X","X","X",9])
        output = Output.new
        game = Play.new(:board => board, :output => output)
        expect(game.tie(game.board)).to eq(false)
    end

    it '#game_over returns true if there is a tie' do
        tie_board = Board.new(:tiles => ["X","O","O","O","X","X","X","X","O"])
        output = Output.new
        game = Play.new(:board => tie_board, :output => output)
        no_winner = game.winner(tie_board, "X")
        tie = game.tie(tie_board)
        expect(game.game_over(no_winner, tie)).to eq(true)
    end

    it '#game_over returns true if there is a winner' do
        winning_board = Board.new(:tiles => ["X","X","X","O",5,"O",7,8,"O"])
        output = Output.new
        game = Play.new(:board => winning_board, :output => output)
        winner = game.winner(winning_board, "X")
        no_tie = game.tie(winning_board)
        expect(game.game_over(winner, no_tie)).to eq(true)
    end

    it '#game_over returns false if there not a tie or a winner' do
        board = Board.new(:tiles => [1,2,3,4,5,6,7,8,9])
        output = Output.new
        player = Player.new(:mark => 'X')
        game = Play.new(:board => board, :output => output, :player => player)
        expect(game.game_over(game.winner(game.board, game.player), game.tie(game.board))).to eq(false)
    end

    it '#make_move places marker on tile' do
        board = Board.new(:tiles => [1,2,3,4,5,6,7,8,9])
        output = Output.new
        player = Player.new(:mark => 'X')
        game = Play.new(:board => board, :output => output, :player => player)
        user_input = 3
        game.make_move(game.board, player.mark, user_input)
        expect(game.board.tiles).to eq([1,2,'X',4,5,6,7,8,9])
    end

    it '#tick checks for end of game. If not, prompts another turn.' do
        board = Board.new(:tiles => ["X","X",3,"O","O",6,7,8,9])
        output = Output.new
        player = Player.new(:mark => 'X')
        game = Play.new(:board => board, :output => output, :player => player)
        
        expect(game.tick(game.board, game.player)).to eq("WINNER")

    end


end