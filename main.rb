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


require_relative './cell_checker'
require_relative './helpers'
class Universe

  def self.next_generation! population
    @population = population
    next_generation = []
    @population.each_with_index do |row, i|
      next_generation << []
      row.each_with_index do |cell, j|
        next_generation.last << CellChecker.new(@population).call(cell, i, j)
      end
    end
    next_generation
  end

end

class UniverseUpper
  def self.need_more_space? population
    #p population
    border = population.size - 1
    i = 0 
    while i <= border do
      j = 0
      while j <= border do
        if ( i == 0 || i == border || j == 0 || j == border ) && population[i][j] == 1
          return true
        end
        j += 1
      end
      i += 1
    end
    return false
  end
end

clear_output()
generation = UniverseUpper.call UniverseUpper.call(array)

UniversePrinter.call generation
sleep(1)
clear_output()

generations_cnt = 0
universe_alive = true
while universe_alive do
  generation = UniverseUpper.call(generation) if UniverseUpper.need_more_space?(generation)
  next_generation = Universe.next_generation! generation
  
  UniversePrinter.call generation
  puts generations_cnt
  if next_generation == generation
    universe_alive = false
  else
    generation = next_generation
    generations_cnt += 1
    
    sleep(0.1)
    clear_output()    
  end

end

sleep(3)

