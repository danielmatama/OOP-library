require 'rspec'
require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new(35, 'Mathematics', 'Mr. Dare')
  end

  describe '#new' do
    it 'should take three parameters and return a Teacher object' do
      expect(@teacher).to be_an_instance_of Teacher
    end

    it 'should set the age correctly' do
      expect(@teacher.age).to eq 35
    end

    it 'should set the specialization correctly' do
      expect(@teacher.specialization).to eq 'Mathematics'
    end

    it 'should set the name correctly' do
      expect(@teacher.name).to eq 'Mr. Dare'
    end
  end

  describe '#can_use_services?' do
    it 'should always return true' do
      expect(@teacher.can_use_services?).to be true
    end
  end
end
