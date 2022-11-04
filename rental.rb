require_relative 'person'

require_relative 'book'

class Rental
  attr_accessor :date, :person, :book

  def initialize(date)
    @date = date

    @person = personperson.rentals << self

    @book = book

    book.rentals << self
  end
end
