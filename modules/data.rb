require 'fileutils'

def check_data_files
  FileUtils.mkdir_p('./data')
  File.open('./data/people.json', 'w') unless File.exist?('./data/people.json')
  File.open('./data/book.json', 'w') unless File.exist?('./data/book.json')
  File.open('./data/rentals.json', 'w') unless File.exist?('./data/rentals.json')
end

def save_persons
  person_store = @persons.map do |person, _index, _id|
    if person.instance_of?(Teacher)
      {
        Domain: 'Teacher',
        name: person.name,
        age: person.age,
        specialization: person.specialization
      }
    else
      {
        Domain: 'Student',
        name: person.name,
        age: person.age,
        parent_permission: person.parent_permission
      }
    end
  end
  File.write('./data/people.json', JSON.pretty_generate(person_store))
end

def read_person
  persons = File.read('./data/people.json')
  
  if !persons.empty?
    JSON.parse(persons).map do |person|
      if person['Domain'] == 'Teacher'
        Teacher.new(person['name'], person['age'], person['specialization'])
      else
        Student.new(person['name'], person['age'], person['classroom'], person['parent_permission'])
      end
    end
  else
    []
  end
end

def save_books
  book_store = @books.map {|book| { title: book.title, author: book.author }}
  File.write('./data/book.json',JSON.pretty_generate(book_store))
end

def read_book
  books = File.read('./data/book.json')

  if !books.empty?
    JSON.parse(books).map {|book| Book.new(book['title'], book['author'])}
  else
    []
  end
end

def save_rentals(date, person_id, book_id)
  new_data = []
  rents = File.read('./data/rentals.json')
  if !rents.empty?
    JSON.parse(rents).map do |rent|
      new_data.push(rent)
    end
  else
    []
  end
  new_data.push(Date: date, book_index: book_id, person_index: person_id)
  File.write('./data/rentals.json', JSON.pretty_generate(new_data)) 
end

def read_rentals
  rent = File.read('./data/rentals.json')
  if !rent.empty?
    JSON.parse(rent).map {|rental| Rental.new(rental['date'], @persons[rental['person_index']], @books[rental['book_index']])}
  else
    []
  end
end
