require 'rspec'
require_relative '../universe/cell_checker'

RSpec.describe Universe::CellChecker do
  describe "call" do
    subject(:checker) { described_class.new(population).call(*params)}
    let(:population) do
      [
        [1,1,1],
        [0,0,0],
        [0,0,0]
      ]
    end
    context 'new born' do
      let(:i) { 1 }
      let(:j) { 1 }
      let(:params) { [population[i][j], i, j] }
      it 'alive' do
        expect(checker).to eq(1)
      end
    end

    context 'dead' do
      let(:i) { 0 }
      let(:j) { 0 }
      let(:params) { [population[i][j], i, j] }
      it 'will dead' do
        expect(checker).to eq(0)
      end
    end
    
    context 'stay alive' do
      let(:i) { 0 }
      let(:j) { 1 }
      let(:params) { [population[i][j], i, j] }
      it 'will dead' do
        expect(checker).to eq(1)
      end
    end
  end
end