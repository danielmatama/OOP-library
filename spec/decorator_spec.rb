require 'rspec'
require_relative '../nameable'

describe Decorator do
  before :each do
    @nameable = Nameable.new
    @decorator = Decorator.new(@nameable)
  end

  describe '#new' do
    it 'should take one parameter and return a Decorator object' do
      expect(@decorator).to be_an_instance_of Decorator
    end

    it 'should set the nameable correctly' do
      expect(@decorator.nameable).to eq @nameable
    end
  end
end
