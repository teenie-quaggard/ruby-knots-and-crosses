require 'tile'

RSpec.describe Tile do
    it '#create_empty_tile creates an empty tile' do
      tile = Tile.new()
      expect(tile.create_empty_tile(4)).to eq("    ")
    end
  
    it '#populate_tile creates an tile with a number in the middle of the empty string' do
      tile = Tile.new()
      empty_tile = "    "
      expect(tile.populate_tile(empty_tile, 1)).to eq("  1  ")
    end
  end