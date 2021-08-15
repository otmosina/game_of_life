require 'benchmark'

population = [
  [1,0,0],
  [1,1,0],
  [1,1,0]
]
#population =  Universe::Creator.call
require_relative '../game.rb'
require 'ruby-prof'
RubyProf.measure_mode = RubyProf::WALL_TIME
result = Benchmark.realtime do
  g = Game.new(population: population, printer: Universe::Printer)
  g.loop
end

puts result