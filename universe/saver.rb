require 'json'
module Universe
  class Saver
    PATH = './storage/'
    attr_accessor :history
    def initialize
      @history = []
    end  
    def call population
      @history.push population
    end

    def generations_cnt
      history.size
    end

    def last
      history.last
    end

    def store
      File.open(filename,'w').write(history.to_json)
    end

    private 

    def filename
      PATH + Time.now.strftime('%Y-%m-%d-%H-%m-%S') + "___" + history.size.to_s 
    end
      
  end
end