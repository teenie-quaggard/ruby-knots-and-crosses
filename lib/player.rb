class Player
    attr_accessor :mark, :name
    def initialize(args = {})
      @mark = args[:mark] 
      @name = args[:name] || "friend"
    end

  end