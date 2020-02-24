require 'play'
require 'board'
require 'output'

RSpec.describe Play do

    describe "#start" do
        it 'prints intro to game' do
            board = Board.new
            output = Output.new(:board => board)
            game = Play.new(:board => board, :output => output)
            
            expect do
                game.start
              end.to output(/Howdy stranger. Welcome to Noughts and Crosses.\n/).to_stdout
        end

        it 'prints a new board' do
            board = Board.new
            output = Output.new(:board => board)
            game = Play.new(:board => board, :output => output)
            
            expect do
                game.start
              end.to output(/ 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n/).to_stdout
        end

        it 'prompts user to input a number' do
            board = Board.new
            output = Output.new(:board => board)
            game = Play.new(:board => board, :output => output)
            
            expect do
                game.start
              end.to output(/Choose and number from 1-9:\n/).to_stdout
        end
    end

    it '#winner returns true when there is a winner' do
        board = Board.new(:board_spaces => ["X","X","X","O",5,"O",7,8,"O"])
        output = Output.new(:board => board)
        game = Play.new(:board => board, :output => output)
        mark = "X"
        expect(game.winner(mark, board.board_spaces)).to eq(true)
    end

    it '#winner returns false when there is not a winner' do
        board = Board.new(:board_spaces => ["X","X","X","O",5,"O",7,8,"O"])
        output = Output.new(:board => board)
        game = Play.new(:board => board, :output => output)
        mark = "O"
        expect(game.winner(mark, board.board_spaces)).to eq(false)
    end

    it '#tie returns true when there is a tie' do
        board = Board.new(:board_spaces => ["X","O","O","O","X","X","X","X","O"])
        output = Output.new(:board => board)
        game = Play.new(:board => board, :output => output)
        expect(game.tie(board.board_spaces)).to eq(true)
    end

    it '#tie returns false when the game is not over' do
        board = Board.new(:board_spaces => ["X","O","O","O","X","X","X","X",9])
        output = Output.new(:board => board)
        game = Play.new(:board => board, :output => output)
        expect(game.tie(board.board_spaces)).to eq(false)
    end


end