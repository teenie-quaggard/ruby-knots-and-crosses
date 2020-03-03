require 'play'
require 'board'
require 'console'
require 'player'

RSpec.describe Play do

    it '#winner returns true when there is a winner' do
        board = Board.new(:tiles => {0=>"X", 1=>"X", 2=>"X", 3=>nil, 4=>nil, 5=>nil, 6=>nil, 7=>nil, 8=>nil})
        console = Console.new(:output=> StringIO.new, :input => StringIO.new)
        player = Player.new(:mark => 'X')
        game = Play.new(:board => board, :console => console, :player => player)

        expect(game.winner(game.board, player.mark)).to eq(true)
    end

    it '#winner returns false when there is not a winner' do
        board = Board.new(:tiles => {0=>"X", 1=>"X", 2=>nil, 3=>nil, 4=>nil, 5=>nil, 6=>nil, 7=>nil, 8=>nil})
        console = Console.new(:output=> StringIO.new, :input => StringIO.new)
        game = Play.new(:board => board, :console => console)
        player = Player.new(:mark => 'O')
        expect(game.winner(game.board, player.mark)).to eq(false)
    end

    it '#tie returns true when there is a tie' do
        board = Board.new(:tiles => {0=>"X", 1=>"O", 2=>"O", 3=>"O", 4=>"X", 5=>"X", 6=>"X", 7=>"X", 8=>"O"})
        console = Console.new(:output=> StringIO.new, :input => StringIO.new)
        player = Player.new(:mark => 'X')
        game = Play.new(:board => board, :console => console, :player => player)
        expect(game.tie(game.board)).to eq(true)
    end

    it '#tie returns false when the game is not over' do
        board = Board.new(:tiles =>  {0=>"X", 1=>"O", 2=>"O", 3=>"O", 4=>"X", 5=>"X", 6=>"X", 7=>"X", 8=>nil})
        console = Console.new(:output=> StringIO.new, :input => StringIO.new)
        player = Player.new(:mark => 'X')
        game = Play.new(:board => board, :console => console, :player => player)
        expect(game.tie(game.board)).to eq(false)
    end

    it '#game_over returns true if there is a tie' do
        tie_board = Board.new(:tiles => {0=>"X", 1=>"O", 2=>"O", 3=>"O", 4=>"X", 5=>"X", 6=>"X", 7=>"X", 8=>"O"})
        console = Console.new(:output=> StringIO.new, :input => StringIO.new)
        players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
        current_player = players[0]
        game = Play.new(:board => tie_board, :console => console, :players => players, :current_player => current_player)
        expect(game.game_over()).to eq(true)
    end

    it '#game_over returns true if there is a winner' do
        winning_board = Board.new(:tiles => {0=>"X", 1=>"X", 2=>"X", 3=>nil, 4=>nil, 5=>nil, 6=>nil, 7=>nil, 8=>nil})
        console = Console.new(:output=> StringIO.new, :input => StringIO.new)
        players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
        current_player = players[0]
        game = Play.new(:board => winning_board, :console => console, :players => players, :current_player => current_player)
        expect(game.game_over()).to eq(true)
    end

    it '#game_over returns false if there not a tie or a winner' do
        board = Board.new(:tiles => {0=>"X", 1=>"X", 2=>nil, 3=>nil, 4=>nil, 5=>nil, 6=>nil, 7=>nil, 8=>nil})
        console = Console.new(:output=> StringIO.new, :input => StringIO.new)
        players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
        current_player = players[0]
        game = Play.new(:board => board, :console => console, :players => players, :current_player => current_player)
        expect(game.game_over()).to eq(false)
    end

    it '#toggle_player changes the current player instance variable' do
        board = Board.new
        output = StringIO.new
        input = StringIO.new
        console = Console.new(:output => output, :input => input)
        players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
        current_player = players[0]
        game = Play.new(:board => board, :console => console, :players => players, :current_player => current_player)
        game.toggle_player
        expect(game.current_player.mark).to eq(players[1].mark)
    end

    it '#turn expects that board tile has been updated with appropriate marker' do
        board = Board.new
        input = StringIO.new "2\n"
        output = StringIO.new
        console = Console.new(:input => input, :output => output)
        players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
        game = Play.new(:board => board, :console => console, :players => players, :current_player => players[0])
        game.turn
        expect(board.tile_content(input.string)).to eq("X")
    end

    it "#valid_move? returns true if user input is valid" do
        board = Board.new(:tiles => {0=>"X", 1=>"X", 2=>nil, 3=>nil, 4=>nil, 5=>nil, 6=>nil, 7=>nil, 8=>nil})
        console = Console.new(:input => StringIO.new, :output => StringIO.new)
        players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
        game = Play.new(:board => board, :console => console, :players => players, :current_player => players[0])
        expect(game.valid_move?('1')).to eq (false)
        expect(game.valid_move?('8')).to eq (true)
        expect(game.valid_move?('Happy days!')).to eq (false)
        expect(game.valid_move?('1999')).to eq (false)
    end


end