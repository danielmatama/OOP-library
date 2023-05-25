require 'rspec'
require_relative '../person'
require_relative '../rental'
require_relative '../book'

describe Person do
  before(:each) do
    @person = Person.new(16, name: 'Dare', parent_permission: true)
  end

  describe '#new' do
    it 'should creates Person instance' do
      expect(@person).to be_an_instance_of Person
    end

    it "should have name set to 'Dare" do
      name = @person.name
      expect(name).to eq 'Dare'
    end
    it 'should have age set to 16' do
      age = @person.age
      expect(age).to eq 16
    end
    it "should have 'parent_permision' set to true" do
      parent_permission = @person.parent_permission
      expect(parent_permission).to eq true
    end
  end

  describe '#add_rental' do
    it "should create a new Rental object and add it to the person's rentals" do
      book = Book.new('Title', 'Author')
      date = '2023-5-25'
      rental = Rental.new(date, @person, book)
      @person.add_rental(book, date)
      expect(@person.rentals).to include(rental)
    end
  end
end
