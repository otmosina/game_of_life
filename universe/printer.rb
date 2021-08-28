# frozen_string_literal: true
require 'colorize'
module Universe 
  class Printer
    DRAW_MAP = {
      1 => 'o'.green,
      0 => ' ',
    }
    def configure &block
      @additional_prints = block
    end  
    def call population
      clear_output()
      population.each do |row|
        row.each do |item|
          print "#{DRAW_MAP[item]} "
        end
        puts ""
      end
      @additional_prints.call
      sleep(0.08)
    end
  end
end
