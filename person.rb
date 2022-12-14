require './nameable'

class Person < Nameable
  attr_accessor :id, :name, :age, :rentals

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def correct_name
    @name
  end

  # Private Methods
  def of_age?
    @age >= 18
  end
  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end
end
