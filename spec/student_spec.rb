require 'rspec'
require_relative '../student'
require_relative '../classroom'

describe Student do
  before :each do
    @classroom = Classroom.new('Math')
    @student = Student.new(16, @classroom, 'Dare', true)
  end

  describe '#new' do
    it 'should take four parameters and return a Student object' do
      expect(@student).to be_an_instance_of Student
    end

    it 'should set the age correctly' do
      expect(@student.age).to eq 16
    end

    it 'should set the classroom correctly' do
      expect(@student.classroom).to eq @classroom
    end

    it 'should set the name correctly' do
      expect(@student.name).to eq 'Dare'
    end

    it 'should set the parent permission correctly' do
      expect(@student.parent_permission).to be true
    end
  end

  describe '#classroom=' do
    it 'should update the classroom and add the student to the new classroom' do
      new_classroom = Classroom.new('Science')
      @student.classroom = new_classroom
      expect(@student.classroom).to eq new_classroom
      expect(new_classroom.students).to include(@student)
    end

    it 'should not add the student to the classroom if already present' do
      @student.classroom = @classroom
      expect(@student.classroom).to eq @classroom

      @student.classroom = @classroom
      expect(@student.classroom).to eq @classroom
      expect(@classroom.students.count(@student)).to eq 1
    end
  end

  describe '#play_hooky' do
    it "should return '¯(ツ)/¯' when called" do
      expect(@student.play_hooky).to eq '¯(ツ)/¯'
    end
  end
end
