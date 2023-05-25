require_relative '../student'

describe Student do
  before :each do
    @student = Student.new('30', 'classroom', 'Israel', true)
  end

  describe 'testing initialize for student' do
    it 'should display name, age, classroom and parent_permission' do
      expect(@student).to be_an_instance_of Student
    end
    it 'Student name ' do
      expect(@student.name).to eq 'Israel'
    end
    it 'Student age' do
      expect(@student.age).to eq '30'
    end
    it 'student parent permission' do
      expect(@student.parent_permission).to be true
    end
  end

  describe 'classroom' do
    it 'should return classroom' do
      expect(@student.classroom).to eq 'classroom'
    end
  end

  describe 'play hooky' do
    it 'should return play hooky status' do
      expect(@student.play_hooky).to eq '¯(ツ)/¯'
    end
  end
end
