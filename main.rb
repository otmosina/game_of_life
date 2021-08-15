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

Universe::Printer.call g.population
g.loop

#exit(0)
Universe::Printer.call saver.last
puts "generations cnt #{saver.generations_cnt}"
saver.store

#sleep(1)
require 'timeout'
command = nil
while command != 'exit' do
  puts "type `exit` to stop"
  puts "type `new` to run new evolving"
  
  begin
    Timeout::timeout 2 do
      command = gets&.chomp
    end
  rescue Timeout::Error
    command = 'new'
  end

  
  if command == 'new'
    g = Game.new(population: Universe::Creator.call, printer: Universe::Printer, saver: saver)
    g.loop
  end
end

