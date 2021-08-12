# frozen_string_literal: true
module Universe 
  class CellChecker
    def initialize population
      @population = population
      @area_size = @population.first.size
    end 

    def call cell, i, j

      alive_cnt = 0

      if j-1 >= 0 && @population[i][j-1] == 1
        alive_cnt += 1
      end

      if j+1 < @area_size && @population[i][j+1] == 1
        alive_cnt += 1
      end

      if i-1 >= 0 && @population[i-1][j] == 1
        alive_cnt += 1
      end

      if i+1 < @area_size && @population[i+1][j] == 1
        alive_cnt += 1
      end

      if i-1 >= 0 && j-1 >= 0 && @population[i-1][j-1] == 1
        alive_cnt += 1
      end

      if i+1 < @area_size && j+1 < @area_size && @population[i+1][j+1] == 1
        alive_cnt += 1
      end

      if i-1 >= 0 && j+1 < @area_size && @population[i-1][j+1] == 1
        alive_cnt += 1
      end

      if j-1 >= 0 && i+1 < @area_size && @population[i+1][j-1] == 1
        alive_cnt += 1
      end          

      if cell == 1
      
        if [2,3].include? alive_cnt
          return 1
        else
          return 0
        end

      else   

        if alive_cnt == 3
          return 1
        else
          return 0
        end      

      end
    end
  end
end