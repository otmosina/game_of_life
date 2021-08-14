module Universe 
  class SizeUpper
    def self.call array
      array = array.dup
      zeros_row = array.first.size.times.inject([]) do |res, _|
        res << 0
      end
      array.unshift zeros_row
      array.push zeros_row
    
      array.map! do |row|
        [0] + row + [0]
      end
      
      array
    end

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
end