# frozen_string_literal: true
module Universe
  class Creator
    def self.call
      random_dimension = rand(10) + 3
      initial_universe = []
      random_dimension.times do |i|
        initial_universe << []
        random_dimension.times do |j|
        initial_universe.last << rand(2)
        end
      end
      initial_universe
    end
  end
end

p Universe::Creator.call