# frozen_string_literal: true
require 'colorize'
module Universe 
  class Printer
    DRAW_MAP = {
      1 => 'o'.green,
      0 => ' ',
    }    
    def self.call population
      population.each do |row|
        row.each do |item|
          print "#{DRAW_MAP[item]} "
        end
        puts ""
      end
      sleep(0.1)
      clear_output()
    end
  end
end
