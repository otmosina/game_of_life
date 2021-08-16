#puts "X X X"
#puts "O O O"
#uts "O X O"

#always_alive
#array = [
#  [0,0,1],
#  [1,0,1],
#  [0,1,1]
#]

array = [
  [0,0,1],
  [1,1,1],
  [0,1,1]
]


array = [
  [1,1,1],
  [1,1,0],
  [0,0,0]
]

# only five generations
population = [
  [1,0,0],
  [1,1,0],
  [1,1,0]
]

require_relative './game.rb'

clear_output()
population = Universe::Creator.call
saver = Universe::Saver.new
g = Game.new(population: population, printer: Universe::Printer, saver: saver)
g.loop
puts "generations cnt #{saver.generations_cnt}"
saver.store


cli_interface do 
  g = Game.new(population: Universe::Creator.call, printer: Universe::Printer, saver: saver)
  g.loop
end


