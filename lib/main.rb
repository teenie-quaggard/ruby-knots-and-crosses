require_relative 'game_constructor'
require_relative 'console'

console = Console.new
program = GameConstructor.new(:console => console)
program.go