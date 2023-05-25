require 'rspec'
require_relative '../nameable'

describe Nameable do
  describe '#correct_name' do
    it 'should raise NotImplementedError' do
      nameable = Nameable.new
      expect { nameable.correct_name }.to raise_error(RuntimeError, /NotImplementedError/)
    end
  end
end
