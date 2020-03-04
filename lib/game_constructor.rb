require_relative 'play'
require_relative 'console'
require_relative 'board'
require_relative 'player'

class GameConstructor 

  attr_accessor :play_again
  def initialize(play_again = false)
    @play_again = play_again
  end

  def new_human_game(board=Board.new, console=Console.new)
    players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
    Play.new(:console => console, :board => board, :players => players, :current_player => players[0])
  end

  def play_game(board=nil, console=nil)
    play = new_human_game(board, console)
    play.tick
  end

  def program_loop (board=nil, console=nil)
    play_again = false
    # puts "\nHowdy stranger. Welcome to Noughts and Crosses.\n"
    play_game(board, console)
    puts "The End"
  end

  # def game_loop
  #   game_play
  #   puts "Alright, see you next time! 👋"
  #   play_again = true

  #   intro
  #   while play_again = true game_loop
  #   outro

  #   if Y
  #     play_again = true
  #     game_play
  #   else
  #     play_again = false
  #     bye
  # end

 

end