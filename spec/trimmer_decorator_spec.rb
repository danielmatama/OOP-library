require 'rspec'
require_relative '../trimmer_decorator'
require_relative '../person'

describe TrimmerDecorator do
  describe '#correct_name' do
    it 'should trim the name to 10 characters' do
      person = Person.new(16, name: 'Damilare Adepoju', parent_permission: true)
      trimmer = TrimmerDecorator.new(person)
      expect(trimmer.correct_name).to eq 'Damilare A'
    end

    it 'should not trim the name because its lenght is <= 10' do
      person = Person.new(16, name: 'Damilare', parent_permission: true)
      trimmer = TrimmerDecorator.new(person)
      expect(trimmer.correct_name).to eq 'Damilare'
    end
  end
end
