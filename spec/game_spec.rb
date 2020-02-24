require 'game'

RSpec.describe Game do
  # describe '#start_game' do
  #   it 'welcomes the user when game starts' do
    
  #     board = BoardConstructor.new(:dimension => 3, :tile_length => 4)
  #     board.create_board()
  #     game = Game.new(:output => Output.new(:board => board.board_tiles))

  #     expect do
  #       game.start_game()
  #     end.to output("Hello stranger. Let's play Noughts and Crosses. Would you like to review the rules of the game? (Y/N)").to_stdout
 
  #   end
  # end

    describe '#make_move' do
      it 'checks the current board and places marker' do
    
      board = BoardConstructor.new(:dimension => 3, :tile_length => 4)
      board.create_board()
      game = Game.new(:output => Output.new(:board => board.board_tiles))
      
      expect(game.make_move()).to eq (true)
      end  
  end

end