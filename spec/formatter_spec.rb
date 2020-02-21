require 'formatter'

RSpec.describe Formatter do
    it 'returns an Integer from a string' do
      formatter = Formatter.new()
      string = "  1  "
      expect(formatter.find_int_in_string(string)).to eq(1)
    end
  
    it '#row_length method finds out the length of a given board based on dimensions of board and tile length' do
      formatter = Formatter.new()
      dimension = 3
      tile_length = 4
      expect(formatter.row_length(dimension, tile_length)).to eq(17)
    end
  
    it '#format_tiles method takes a tile and appends a divider where necessary' do
      formatter1 = Formatter.new(:tile_content => "  1  ")
      formatter3 = Formatter.new(:tile_content => "  3  ")
      formatter9 = Formatter.new(:tile_content => "  9  ")
      expect(formatter1.format_tiles()).to eq("  1  |")
      expect(formatter3.format_tiles()).to eq("  3  \n-----------------\n")
      expect(formatter9.format_tiles()).to eq("  9  ")
    end
    
  end