require_relative("../db/sql_runner")
require_relative("./student.rb")


class House

attr_reader :id
attr_accessor :house_name, :house_logo

def initialize(options)
  @house_name = options['house_name']
  @house_logo = options['house_logo']
  @id = options['id'].to_i
end

  def save()
    sql = "INSERT INTO houses
    (house_name, house_logo) VALUES
    ($1, $2) RETURNING *"
    values = [@house_name, @house_logo]
    house_info = SqlRunner.run(sql, values)
    @id = house_info.first()['id'].to_i()
  end


  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    result = houses.map { |house| House.new(house) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run(sql, values)
    result = House.new(house.first())
    return result
  end

  def self.find_student(id)
    sql = "SELECT students.* FROM students WHERE house_id = $1"
    values = [id]
    result = SqlRunner.run( sql,values )
    return result.map{ |student| Student.new(student)}
  end




end
