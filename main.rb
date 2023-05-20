require_relative 'app'

def run_option
  puts 'Welcome to the Library App!'
  puts 'Please choose an option:'
  puts '1 - List all books.'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person ID'
  puts '7 - Quit'
end

def create_person(app)
  puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]:-'
  option = gets.chomp
  parent_permission = true
  puts 'age:-'
  age = gets.chomp.to_i
  puts 'name:-'
  name = gets.chomp
  puts 'Has parent permission?[Y/N]'
  val = gets.chomp
  parent_permission = false if %w[N n NO no No].include?(val)

  case option.to_i
  when 1
    app.create_student(age, name, parent_permission)
  when 2
    puts 'specialization:-'
    specialization = gets.chomp
    app.create_teacher(age, specialization, name, parent_permission)
  else
    puts 'Invalid input ):'
  end
end

def handel_option(option, app)
  case option
  when 3
    create_person(app)
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    puts 'Enter person ID:-'
    id = gets.chomp.to_i
    app.list_person_rentals(id)
  when 7
    puts 'Thanks You!!...'
    return false
  else
    puts 'Invalid option. Please try again.'
  end
  true
end

def main
  status = true
  app = App.new
  while status
    run_option
    option = gets.chomp.to_i
    if option == 1
      app.list_books
    elsif option == 2
      app.list_peoples
    else
      status = handel_option(option, app)
    end
  end
end

main
