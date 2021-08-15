# frozen_string_literal: true
require 'colorize'
module Universe 
  class Printer
    DRAW_MAP = {
      1 => 'o'.green,
      0 => ' ',
    }    
    def self.call population
      clear_output()
      population.each do |row|
        row.each do |item|
          print "#{DRAW_MAP[item]} "
        end
        puts ""
      end
      sleep(0.1)
    end
  end
end
