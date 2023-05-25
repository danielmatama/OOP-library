require 'rspec'
require_relative '../capitalize_decorator'
require_relative '../person'

describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'should capitalize the first character of the name' do
      person = Person.new(16, name: 'damilare adepoju', parent_permission: true)
      capitalize = CapitalizeDecorator.new(person)
      expect(capitalize.correct_name).to eq 'Damilare adepoju'
    end
  end
end
