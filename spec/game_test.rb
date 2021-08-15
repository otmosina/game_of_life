require 'rspec'
require_relative '../game'
require_relative '../universe/printer'

RSpec.describe Game do
  describe 'call' do
    let(:saver) { Universe::Saver.new }
    let(:population) do
      [
        [1,0,0],
        [1,1,0],
        [1,1,0]
      ]      
    end

    let(:last_generation) do
      [
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0]
      ]
    end    
    subject(:game) {described_class.new(population: population, saver: saver)}
    before do
      game.loop
    end
    it 'be true' do
      expect(saver.last).to eq(last_generation)
    end
  end
end
