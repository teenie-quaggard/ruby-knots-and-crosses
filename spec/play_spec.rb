require 'play'
require 'board'
require 'output'
require 'player'

RSpec.describe Play do

    describe "#start" do
        it 'prints intro to game' do
            board = Board.new
            output = Output.new
            game = Play.new(:board => board, :output => output)
            
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
        game = Play.new(:board => board, :output => output)
        mark = "X"
        expect(game.winner(game.board, mark)).to eq(true)
    end

    it '#winner returns false when there is not a winner' do
        board = Board.new(:tiles => ["X","X","X","O",5,"O",7,8,"O"])
        output = Output.new
        game = Play.new(:board => board, :output => output)
        mark = "O"
        expect(game.winner(game.board, mark)).to eq(false)
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
        board = Board.new(:tiles => [1,2,3,4,5,6,7,8,9])
        output = Output.new
        player = Player.new(:mark => 'X')
        game = Play.new(:board => board, :output => output, :player => player)
        game.tick(game.board, game.player)

    end


end