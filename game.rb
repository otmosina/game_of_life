require_relative './helpers'
require_relative './universe/size_upper'
require_relative './universe/printer'
require_relative './universe/creator'
require_relative './universe/cell_checker'
require_relative './universe/saver'

class Game
  attr_accessor :population, :printer, :saver

  def initialize(population:, printer: proc {}, saver: proc {} )
    @saver = saver
    @printer = printer
    @population = population
    @universe_alive = true
  end

  def loop
    while @universe_alive do
      @population = Universe::SizeUpper.call(@population) if Universe::SizeUpper.need_more_space?(@population)
      next_generation = self.get_next_generation
      if detect_infinity(next_generation)#@population == next_generation
        @universe_alive = false
      else
        printer.call population
        @population = next_generation
      end
      saver.call @population
    end
  end

  private
  
  def detect_infinity new_generation
    saver.was_in_history new_generation
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

end