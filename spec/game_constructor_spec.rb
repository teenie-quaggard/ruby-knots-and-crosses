require 'game_constructor'

# game constructor initialized with console

RSpec.describe GameConstructor do

  it "#game creates a new instance of the Play class" do
    constructor = GameConstructor.new
    expect(constructor.new_game).to be_an_instance_of(Play)
  end
end