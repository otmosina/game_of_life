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

require_relative './game.rb'

clear_output()

g = Game.new(population: Universe::Creator.call)

Universe::Printer.call g.population
g.loop

exit(0)

sleep(1)
command = nil
while command&.chomp != 'exit' do
  puts "type `exit` to stop"
  command = gets  
end

