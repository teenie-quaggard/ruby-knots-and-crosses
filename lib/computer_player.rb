class ComputerPlayer

  attr_reader :mark, :console
  def initialize(args = {})
      @mark = args[:mark]
  end

  def get_input(board, open_tiles)
    random_move(open_tiles)
  end

  def make_move(board, mark, input)
      board.make_move(mark, input)
  end

  def random_move(open_tiles)
    arr = convert_hash_to_array(open_tiles)
    number_of_potential_moves = arr.length
    index = random_index(number_of_potential_moves)
    arr[index][0]
  end

  def convert_hash_to_array(open_tiles)
    open_tiles.to_a
  end

  def random_index(highest_index)
    0 + rand(highest_index)
  end

end