require 'rspec'
require_relative '../game'
require_relative '../universe/printer'

RSpec.describe Game do
  describe 'call' do

    subject(:upper) {described_class.call(array)}
    #before do
    #  Universe::Printer.call(upper)
    #end
    xit 'be true' do
      expect(upper.first.size).to eq(array.size + 2)
    end
  end
end
