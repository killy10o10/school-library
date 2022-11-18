require_relative 'person'

require_relative 'book'

class Rental
  attr_accessor :date, :person, :book

  def initialize(date, book, person)
    @date = date

    @person = person

    person.rentals << self

    @book = book

    book.rentals << self
  end

  def as_json()
    {
      person_id: @person.id,
      date: @date,
      book_title: @book.title,
      book_author: @book_author
    }
  end
end
