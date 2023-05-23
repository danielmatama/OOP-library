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
  File.open('./data/people.json', 'w') do |file|
    file.puts(JSON.pretty_generate(person_store))
  end
end

def read_person
  if File.exist?('./data/people.json')

    persons = JSON.parse(File.read('./data/people.json'))
    persons.map do |person|
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
  file = File.open('./data/book.json', 'w')
  book_store = @books.map do |book|
    { title: book.title, author: book.author }
  end
  file.puts(JSON.pretty_generate(book_store))
end

def read_book
  if File.exist?('./data/book.json')
    books = JSON.parse(File.read('./data/book.json'))
    books.map do |book|
      Book.new(book['title'], book['author'])
    end
  else
    []
  end
end

def save_rentals(date, person_id, book_id)
  new_data = []
  if File.exist?('./data/rentals.json')
    rents = JSON.parse(File.read('./data/rentals.json'))
    rents.map do |rent|
      new_data.push(rent)
    end
  else
    []
  end
  new_data.push(Date: date, book_index: book_id, person_index: person_id)
  File.open('./data/rentals.json', 'w') do |file|
    file.puts(JSON.pretty_generate(new_data))
  end
end

def read_rentals
  if File.exist?('./data/rentals.json')
    rent = JSON.parse(File.read('./data/rentals.json'))
    rent.map do |rental|
      Rental.new(rental['date'], @persons[rental['person_index']], @books[rental['book_index']])
    end
  else
    []
  end
end
