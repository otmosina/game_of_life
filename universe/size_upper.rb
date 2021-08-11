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
  end
end