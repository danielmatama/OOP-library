require 'rspec'
require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Math')
    @student = Student.new(16, @classroom, 'Dare', true)
  end

  describe '#new' do
    it 'should take one parameter and return a Classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end

    it 'should set the label correctly' do
      expect(@classroom.label).to eq 'Math'
    end

    it 'should initialize students as an empty array' do
      expect(@classroom.students).to be_an_instance_of Array
      expect(@classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'should add the student to the classroom' do
      @classroom.add_student(@student)
      expect(@classroom.students).to include(@student)
    end

    it "should set the student's classroom correctly" do
      @classroom.add_student(@student)
      expect(@student.classroom).to eq @classroom
    end

    it 'should not add the student again if already present' do
      @classroom.add_student(@student)
      expect(@classroom.students.count(@student)).to eq 1

      @classroom.add_student(@student)
      expect(@classroom.students.count(@student)).to eq 1
    end
  end
end
