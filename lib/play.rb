class Play

    WINNING_INDICES = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    attr_reader :board, :player1, :player2, :output
    def initialize(args)
        @board = args[:board]
        @player1 = args[:player1]
        @player2 = args[:player2]
        @output = args[:output]
    end

    def start 
        @output.intro
    end

    def winner(mark, tiles)
        indices = tiles.each_index.select{|i| tiles[i] == mark}
        WINNING_INDICES.include? indices
    end

    def tie(tiles)
        tiles.all? {|tile| tile.instance_of?(String)}
    end


    

end