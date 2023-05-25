require_relative '../decorator'

describe Decorator do
  let(:nameable) { double('Nameable') }
  subject { described_class.new(nameable) }

  describe '#correct_name' do
    it 'should return the correct name' do
      allow(nameable).to receive(:correct_name).and_return('Tash Israel')
      expect(subject.correct_name).to eql 'Tash Israel'
    end
  end
end
