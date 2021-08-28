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
#GC.disable
clear_output()
population = Universe::Creator.call
saver = Universe::Saver.new
printer = Universe::Printer.new

printer.configure do 
  puts (`ps -o rss= -p #{Process.pid}`.to_i / 1024).to_s << ' mb'
end
g = Game.new(population: population, printer: printer, saver: saver)
g.loop

puts "generations cnt #{saver.generations_cnt}"
saver.store


cli_interface do |command| 
  if command == 'new'
    printer = Universe::Printer.new

    printer.configure do 
      puts (`ps -o rss= -p #{Process.pid}`.to_i / 1024).to_s << ' mb'
    end

    g = Game.new(population: Universe::Creator.call, printer: printer, saver: saver)
    g.loop
  end
end


