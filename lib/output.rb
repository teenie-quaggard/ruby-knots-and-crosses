class Output
    attr_accessor :board
    def initialize(args={})
        @board = args[:board]
    end

    def prints_empty_board
        puts @board
    end
end