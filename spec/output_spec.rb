require 'output'
require 'board_constructor'

RSpec.describe Output do
    describe '#prints_board method' do
      it 'prints a board to the console' do
      board = BoardConstructor.new(:single_tile => Tile)
      board.create_board()
      output = Output.new(:board => board.board_tiles)
  
      expect do
            output.prints_board(output.board)
          end.to output("  1  |  2  |  3  \n-----------------\n  4  |  5  |  6  \n-----------------\n  7  |  8  |  9  \n").to_stdout
      end
    end
  end



# RSpec.describe Game::Output do
#   WELCOME_MESSAGE = "Hello sunshine. Welcome to Noughts and Crosses."
#   specify { expect { Game::Output.prints_message(WELCOME_MESSAGE) }.to output.to_stdout }
#   specify { expect { Game::Output.prints_message(WELCOME_MESSAGE) }.to output("Hello sunshine. Welcome to Noughts and Crosses.\n").to_stdout }
#   specify { expect { Game::Output.prints_message(WELCOME_MESSAGE) }.to output(/Hello sunshine. Welcome to Noughts and Crosses./).to_stdout }
#   specify { expect { }.to_not output.to_stdout }
#   specify { expect { Game::Output.prints_message(WELCOME_MESSAGE) }.to_not output('bar').to_stdout }
#   specify { expect { Game::Output.prints_message(WELCOME_MESSAGE) }.to_not output(/bar/).to_stdout }
# end