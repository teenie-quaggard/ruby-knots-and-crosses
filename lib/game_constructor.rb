require_relative 'play'
require_relative 'board'
require_relative 'player'
require_relative 'computer_player'

class GameConstructor 
  
  attr_reader :console, :game_type
  def initialize(args={})
    @console = args[:console]
    @game_type = args[:game_type]
  end

  def go(board=Board.new)
    @console.intro
    get_game_type
    play(@game_type)
    restart?
  end

  def get_game_type
    input = @console.game_type
    if input == "A"
      @game_type = one_player_game
    elsif input == "B"
      @game_type = two_player_game
    else 
      @console.incorrect_input
    end
  end

  def play(game)
    game.tick while game.end == false
  end

  def restart?
    play_again = @console.outro
    play_again == "N" ? @console.bye : go
  end

  def two_player_game(board=Board.new)
    players = [Player.new(:mark => 'X', :console => @console), Player.new(:mark => 'O', :console => @console)]
    Play.new(:console => @console, :board => board, :players => players, :current_player => players[0])
  end

  def one_player_game(board=Board.new)
    players = [Player.new(:mark => 'X', :console => @console), ComputerPlayer.new(:mark => 'O')]
    Play.new(:console => @console, :board => board, :players => players, :current_player => players[0])
  end

end