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

require_relative './helpers'
require_relative './universe/size_upper'
require_relative './universe/printer'
require_relative './universe/creator'
require_relative './universe/cell_checker'

class Game
  attr_accessor :population

  def initialize(population:)
    @population = population
    @generations_cnt = 0
    @universe_alive = true
  end

  def get_next_generation
    next_generation = []
    @population.each_with_index do |row, i|
      next_generation << []
      row.each_with_index do |cell, j|
        next_generation.last << Universe::CellChecker.new(@population).call(cell, i, j)
      end
    end
    next_generation
  end

  def loop
    while @universe_alive do
      @population = Universe::SizeUpper.call(@population) if Universe::SizeUpper.need_more_space?(@population)
      next_generation = self.get_next_generation
      if @population == next_generation
        @universe_alive = false
      else
        Universe::Printer.call population
        @population = next_generation
        @generations_cnt += 1
      end
    end
  end

end

clear_output()

g = Game.new(population: Universe::Creator.call)

Universe::Printer.call g.population

g.loop


sleep(1)
command = nil
while command&.chomp != 'exit' do
  puts "type `exit` to stop"
  command = gets  
end

