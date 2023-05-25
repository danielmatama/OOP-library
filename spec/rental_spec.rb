require 'rspec'
require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  before :each do
    @person = Person.new(25)
    @book = Book.new('Title', 'Author')
    @rental = Rental.new('2023-05-25', @person, @book)
  end

  describe '#new' do
    it 'should take three parameters and return a Rental object' do
      expect(@rental).to be_an_instance_of Rental
    end

    it 'should set the date correctly' do
      expect(@rental.date).to eq '2023-05-25'
    end

    it 'should set the person correctly' do
      expect(@rental.person).to eq @person
    end

    it 'should set the book correctly' do
      expect(@rental.book).to eq @book
    end

    it "should add the rental to the person's rentals" do
      expect(@person.rentals).to include(@rental)
    end

    it "should add the rental to the book's rentals" do
      expect(@book.rentals).to include(@rental)
    end
  end
end
