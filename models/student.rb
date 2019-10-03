require_relative('../db/sql_runner')
require_relative('./house.rb')

class Student

  attr_reader  :id
  attr_accessor :house_id, :first_name, :last_name, :age

  def initialize( options )
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @house_id = options['house_id'].to_i
  end

  def save()
    sql = "INSERT INTO students
    (
      first_name,
      last_name,
      age,
      house_id
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@first_name, @last_name, @age, @house_id]
    student_info = SqlRunner.run(sql, values)
    @id = student_info.first()['id'].to_i
  end

  def update()
    sql = "UPDATE students
    SET
    (
      first_name,
      last_name,
      age,
      house_id
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@first_name, @last_name, @age, @house_id, @id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM students;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM students
    WHERE id = $1;"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM students;"
    students = SqlRunner.run( sql )
    result = students.map { |student| Student.new( student ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM students WHERE id = $1;"
    values = [id]
    student = SqlRunner.run( sql, values )
    result = Student.new( student.first )
    return result
  end

  def get_house_name
    sql = "SELECT house_name FROM houses WHERE id = $1"
    values = [@house_id]
    house = SqlRunner.run( sql, values )[0]["house_name"]
    return house
  end

end
