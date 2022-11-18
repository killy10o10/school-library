require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, parent_permission, name = 'unknown')
    @classroom = classroom

    super(age, name, parent_permission: parent_permission)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def as_json()
    {

      type: Student,

      name: @name,

      id: @id,

      age: @age,

      classroom: @classroom,

      parent_permission: @parent_permission

    }
  end
end
