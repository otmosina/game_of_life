# frozen_string_literal: true
module Universe 
  class Printer
    DRAW_MAP = {
      1 => 'X',
      0 => 'O',
    }    
    def self.call population
        population.each do |row|
          row.each do |item|
            print "#{DRAW_MAP[item]} "
          end
          puts ""
        end
    end
  end
end
