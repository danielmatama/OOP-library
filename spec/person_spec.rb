require_relative '../person'

describe Person do
  before :each do
    @person = Person.new(24, 'Tash')
  end
  describe 'testing initialize' do
    it 'creates a new Person instance' do
      expect(@person).to be_an_instance_of(Person)
    end
  end

  describe 'testing age' do
    it 'expects age to return a number' do
      expect(@person.age).to eql 24
    end
  end

  describe 'testing name' do
    it 'expects name to return a string' do
      expect(@person.name).to eql 'Tash'
    end
  end

  describe 'testing if person can use services' do
    it 'returns true if the person is of age' do
      expect(@person.can_use_services?).to eq(true)
    end

    it 'returns true if the person has parent permission' do
      @person.age = 18
      expect(@person.can_use_services?).to eq(true)
    end

    it 'returns false if the person is not of age and does not have parent permission' do
      @person.age = 15
      @person.parent_permission = false
      expect(@person.can_use_services?).to eql false
    end
  end

  describe 'testin for correct_name' do
    it 'returns the name attribute' do
      expect(@person.correct_name).to eq('Tash')
    end
  end

  describe 'testing for add_rental' do
    let(:book) { double('book', rentals: []) }
    let(:date) { double('date') }
    it 'creates an instance of Rental' do
      expect(@person.add_rental(book, date)).to be_an_instance_of(Rental)
    end
  end
end
