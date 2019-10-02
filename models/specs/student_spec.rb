require("minitest/autorun")
require_relative("../student")

class TestStudent < MiniTest::Test

  def setup
    options = {"id" => 1, "first_name" => "Ron", "last_name" => "Weasley",
      "age" => 12, "house" => "Gryffindor"}

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

  def test_quantity()
    result = @student.house()
    assert_equal("Gryffindor", result)
  end

end
