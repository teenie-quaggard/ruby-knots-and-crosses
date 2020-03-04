require_relative 'play'
require_relative 'board'
require_relative 'player'

class GameConstructor 
  
  attr_reader :console
  def initialize(args={})
    @console = args[:console]
  end

  def go(board=Board.new)
    @console.intro

    @console.game_type
    input = @console.get_input.capitalize
    if input == "A"
      game = one_player_game(board)
    elsif input == "B"
      puts 'in it'
      game = two_player_game(board)
    else 
      puts "Sorry incorrect input"
    end

    game = two_player_game(board)

    play(game)
    restart?
  end

  # def get_game_type
  #   @console.game_type
  #   input = @console.get_input
  #   if input == "A"
  #     game = one_player_game
  #   elsif input == "B"
  #     game = two_player_game
  #   end
  # end


  def play(game)
    game.tick while game.end == false
  end

  def restart?
    play_again = @console.outro
    play_again == "N" ? @console.bye : go
  end

  def two_player_game(board=Board.new)
    players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
    Play.new(:console => @console, :board => board, :players => players, :current_player => players[0])
  end

  # def one_player_game(board=Board.new)
  #   players = [Player.new(:mark => 'X'), ComputerPlayer.new(:mark => 'O')]
  #   Play.new(:console => @console, :board => board, :players => players, :current_player => players[0])
  # end

end