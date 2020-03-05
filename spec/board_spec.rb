require 'board'

RSpec.describe Board do
    it 'can be initialized with an array of spaces' do
        board = Board.new
        expect(board.tiles).to eq({
            0 => nil,
            1 => nil,
            2 => nil,
            3 => nil,
            4 => nil,
            5 => nil,
            6 => nil,
            7 => nil,
            8 => nil
        })
    end

    it '#make_move replaces number in the tile array with a marker' do
        board = Board.new
        board.make_move("X", "1")
        expect(board.tile_content(1)).to eq("X")
    end


    it "return the possible moves on the board" do 
        empty_board = Board.new
        full_board = B
        
        expect(empty_board.find_empty_tiles(empty_board))
    end

    it '#tile_content returns data from a tile' do
        board = Board.new
        board.make_move("X", "1")
        expect(board.tile_content(1)).to eq ("X")
        expect(board.tile_content(2)).to eq (nil)
    end

    it '#spot_taken? returns true if someone has already submitted that move' do
        board = Board.new
        board.make_move("X", "1")
        expect(board.spot_taken?(1)).to eq (true)
        expect(board.spot_taken?(2)).to eq (false)
    end

    it '#bad_input? returns true if user inputs an integer that is within the range of the board' do
        board = Board.new
        expect(board.bad_input?("adadf")).to eq (true)
        expect(board.bad_input?("2000")).to eq (true)
        expect(board.bad_input?("3")).to eq (false)
    end


end