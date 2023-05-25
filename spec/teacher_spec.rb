require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('50', 'Footbal', 'Pep')
  end

  describe 'test initialize' do
    it 'should display age, specialization and name ' do
      expect(@teacher).to be_an_instance_of Teacher
    end
    it 'Teacher name ' do
      expect(@teacher.name).to eq 'Pep'
    end
    it 'teacher age' do
      expect(@teacher.age).to eq '50'
    end
    it 'Teacher parent specializatio' do
      expect(@teacher.specialization).to eq 'Footbal'
    end
  end

  describe 'test if teacher can use services' do
    it 'should return true' do
      expect(@teacher.can_use_services?).to eq(true)
    end
  end
end
