require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, parent_permission: true, name: 'Unknown')
    super()
    @id = rand(1..500)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(book, self, date)
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
    false
  end

  private

  def of_age?
    @age >= 18
  end
end
