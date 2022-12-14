require './teacher'
require './student'
require './book'
require './rental'
require './classroom'
require './person'

class App
  attr_accessor :books, :students, :peoples, :rentals

  def initialize
    @books = []
    @peoples = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'There are no books'
    else
      @books.each_with_index do |bk, i|
        puts "#{i}) Title: #{bk.title}, Author: #{bk.author}"
      end
    end
  end

  def list_all_people
    if @peoples.empty?
      puts 'There are no People'
    else
      @peoples.each_with_index do |p, i|
        puts "#{i}) [#{p.class}] Name: #{p.name}, Age: #{p.age}, ID: #{p.id}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp.to_s
    print 'Age:'
    age = gets.chomp.to_i
    case choice
    when 1
      print 'Student\'s Classroom'
      classroom = gets.chomp.to_s
      print 'Has Parent Permission? Y / N'
      permission = gets.chomp.strip.upcase
      create_student(age, name, classroom, permission)
    when 2
      print 'Teacher\'s Specialization'
      specialization = gets.chomp.to_s
      create_teacher(age, name, specialization)
    else
      puts 'INVALID NUMBER!!'
    end
  end

  def create_student(age, name, classroom, permission)
    case permission
    when 'Y'
      @peoples.push(Student.new(classroom, age, true, name))
      puts 'Student created successfully.'
    when 'N'
      @peoples.push(Student.new(classroom, age, false, name))
      puts 'Student created successfully.'
    else
      puts 'Invalid Input'
    end
  end

  def create_teacher(age, name, specialization)
    @peoples.push(Teacher.new(specialization, age, true, name))
    puts 'Teacher created successfully.'
  end

  def add_new_book
    print 'Book Title: '
    title = gets.chomp
    print 'Book Author: '
    author = gets.chomp
    create_book(title, author)
  end

  def create_book(title, author)
    @books.push(Book.new(title, author))
    puts 'Book created successfully!'
  end

  def add_new_rental
    puts 'Select a book from the following list by number'
    list_all_books
    bk_choice = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    list_all_people
    p_choice = gets.chomp.to_i
    print 'Enter today\'s date: '
    date = gets.chomp
    create_rental(bk_choice, p_choice, date)
  end

  def create_rental(bk_choice, p_choice, date)
    @rentals.push(Rental.new(date, @books[bk_choice], @peoples[p_choice]))
    puts 'Rental added successfully'
  end

  def list_all_rentals
    list_all_people
    print 'Id of person: '
    id = gets.chomp.to_i
    @rentals.each_with_index do |rental, _i| \
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == id
    end
  end
end
