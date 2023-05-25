require_relative '../person'
require_relative '../rental'
require_relative '../book'

describe Rental do
  context 'When providing a book and a person' do
    person = Person.new('24', 'Tash', true)
    book = Book.new('Ruby', 'Jose')

    rented = Rental.new('11-01-2023', book, person)

    it 'Should create rental for person' do
      expect(person.rentals).to include(rented)
    end
  end
end
