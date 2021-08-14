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
  def self.next_generation! population
    @population = population
    next_generation = []
    @population.each_with_index do |row, i|
      next_generation << []
      row.each_with_index do |cell, j|
        next_generation.last << Universe::CellChecker.new(@population).call(cell, i, j)
      end
    end
    next_generation
  end

end

clear_output()
initial_universe = Universe::Creator.call
generation = initial_universe
#generation = Universe::SizeUpper.call Universe::SizeUpper.call(array)

Universe::Printer.call generation
sleep(1)
clear_output()

generations_cnt = 0
universe_alive = true
while universe_alive do
  generation = Universe::SizeUpper.call(generation) if Universe::SizeUpper.need_more_space?(generation)
  next_generation = Game.next_generation! generation
  
  Universe::Printer.call generation
  #puts generations_cnt
  if next_generation == generation
    # uncomment if do not want infinitive creations
    universe_alive = false
    #generation = Universe::Creator.call
  else
    generation = next_generation
    generations_cnt += 1
    
    sleep(0.1)
    clear_output()    
  end
  #option = gets
end
sleep(1)
command = nil
while command&.chomp != 'exit' do
  puts "type `exit` to stop"
  command = gets  
end

