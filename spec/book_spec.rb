require 'rspec/mocks'
require_relative '../book'
require_relative '../rental'

RSpec.describe Book do
  before :each do
    @book = Book.new('Title', 'Author')
  end

  describe '#new' do
    it 'should take two parameters and returns Book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '#title and #author' do
    it "should have 'Title' as title" do
      expect(@book.title).to eq 'Title'
    end
    it "should have 'Author' as author" do
      expect(@book.author).to eq 'Author'
    end
  end

  describe '#add_rental' do
    it 'should adds a rental to the book' do
      rental = double('rental')
      expect(rental).to receive(:book=).with(@book)
      @book.add_rental(rental)
      expect(@book.rentals).to include(rental)
    end
  end
end
