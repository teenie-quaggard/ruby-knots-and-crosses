class Player
    attr_accessor :mark, :name
    def initialize(args = {})
      @mark = args[:mark] 
      @name = args[:name] || "stranger"
    end

    def get_name
      puts "What's your name?"
      @name = gets.chomp.capitalize()
      puts "Hi #{@name}! Good luck!"
    end
  end 