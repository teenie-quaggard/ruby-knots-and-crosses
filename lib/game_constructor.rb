require_relative 'play'
require_relative 'console'
require_relative 'board'
require_relative 'player'

class GameConstructor 

  def go(board=Board.new, console=Console.new)
    play = new_human_game(board, console)
    play.tick
    
    if play.end
      print "Would you like to play again? (Y/N): "
      input = gets.chomp().capitalize
      if (input == "N")
          puts "Alright, see you next time! 👋"
      else
          go
      end
    end
    
  end

  def new_human_game(board=Board.new, console=Console.new)
    players = [Player.new(:mark => 'X'), Player.new(:mark => 'O')]
    Play.new(:console => console, :board => board, :players => players, :current_player => players[0])
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