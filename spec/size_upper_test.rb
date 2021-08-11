require 'rspec'
require_relative '../universe/size_upper'
require_relative '../universe/printer'

RSpec.describe Universe::SizeUpper do
  describe 'call' do

    subject(:upper) {described_class.call(array)}
    let(:array) do [
      [0,0,1],
      [1,1,1],
      [0,1,1]
    ]
    end
    #before do
    #  Universe::Printer.call(upper)
    #end
    it 'be true' do
      expect(upper.first.size).to eq(array.size + 2)
    end
  end
end
