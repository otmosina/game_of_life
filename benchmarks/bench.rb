
=begin
require 'benchmark/ips'
Benchmark.ips do |x|
  x.report("game") do
    g.loop    
  end
  x.compare
end
=end
population = [
  [1,1,1],
  [1,1,0],
  [0,0,0]
]
require_relative '../game.rb'
require 'ruby-prof'
RubyProf.measure_mode = RubyProf::WALL_TIME
result = RubyProf.profile do
  g = Game.new(population: Universe::Creator.call)
  g.loop
end

printer = RubyProf::GraphHtmlPrinter.new(result)
printer.print(File.open('./benchmarks/reports/graph.html', 'w+'))
`open ./benchmarks/reports/graph.html `