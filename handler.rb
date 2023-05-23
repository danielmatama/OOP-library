class Handler
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_all_books
    puts 'Database is empty! Add a book.' if @books.empty?
    @books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_persons
    puts 'Database is empty! Add a person.' if @persons.empty?
    @persons.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, id: #{person.id}"
    end
  end

  def list_all_rentals
    list_all_persons
    puts 'To see rentals enter the person ID: '
    id = gets.chomp.to_i

    puts "Rented Books for #{id}:"
    test = false
    @rentals.any? do |rental|
      if rental.person.id == id
        test = true
        puts "Person: #{rental.person.name} Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      end
    end
    puts 'No record were found for the given ID' unless test
  end

  def create_person
    print 'press 1 to create a student, press 2 to create a teacher : '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input. Try again'
    end
    save_persons
  end

  def create_student
    puts 'create a new student'
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'n'
      student = Student.new(age, 'classroom', name, false)
      @persons << student
      puts 'Student doesn\'t have parent permission, can\'t rent books'
    when 'y'
      student = Student.new(age, 'classroom', name, true)
      @persons << student
      puts 'Student created successfully'
    end
  end

  def create_teacher
    puts 'create a new teacher'
    print 'Age: '
    age = gets.chomp.to_i
    print 'Specialization: '
    specialization = gets.chomp
    print 'Name: '
    name = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @persons << teacher
    puts 'Teacher created successfully'
  end

  def create_book
    puts 'create a new book'
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets
    book = Book.new(title, author)
    @books.push(book)
    puts "Book #{title} created successfully."
    save_books
  end

  def create_rental
    puts 'select the book you want to rent by entering it\'s number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i
    puts 'select person from the list by its number'
    @persons.each_with_index do |person, index|
      puts "#{index} [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s
    rental = Rental.new(date, @persons[person_id], @books[book_id])
    @rentals << rental

    puts 'Rental created successfully'
    save_rentals(date, person_id, book_id)
  end

  def start
    @persons = read_person
    @books = read_book
    @rentals = read_rentals
  end
end
