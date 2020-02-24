require 'player'

RSpec.describe Player do
    it 'creates a new player with a mark and name' do
      mark = 'X'
      name = 'Straight Shooter'
      new_player = Player.new(:mark => mark, :name => name)
      expect(new_player.mark).to eq('X')
      expect(new_player.name).to eq('Straight Shooter')
      expect(new_player.mark).to_not eq('O')
      expect(new_player.name).to_not eq('')
    end
  end