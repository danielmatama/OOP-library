require_relative '../book'

describe Book do
  context 'When testing the Book class' do
    book = Book.new('Ruby', 'Jose')

    it 'should display Book title and Book author' do
      expect(book).to be_an_instance_of Book
    end
    it 'title of book' do
      expect(book.title).to eq 'Ruby'
    end
    it 'author of book' do
      expect(book.author).to eq 'Jose'
    end
  end
end
