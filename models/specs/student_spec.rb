require("minitest/autorun")
require_relative("../student")
require_relative("../house")

class TestStudent < MiniTest::Test

  def setup

    house_options = {"id" => 1, "house_name" => "Gryffindor", "house_logo" => "Gryffindor_logo"
    }

    @house = House.new(house_options)

    options = { "first_name" => "Ron", "last_name" => "Weasley",
      "age" => 12, "house_id" => @house.id}

    @student = Student.new(options)
  end

  def test_first_name()
    result = @student.first_name()
    assert_equal("Ron", result)
  end

  def test_last_name()
    result = @student.last_name()
    assert_equal("Weasley", result)
  end

  def test_age()
    result = @student.age()
    assert_equal(12, result)
  end

  def test_house()
    result = @student.house_id()
    p @student
    p @house
    p @student.house_id()
    assert_equal(1, result)
  end

end
