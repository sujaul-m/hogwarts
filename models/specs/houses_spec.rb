require("minitest/autorun")
require_relative("../house")
require_relative("../student")

class TestHouse < MiniTest::Test

  def setup
    options = {"house_name" => "Gryffindor", "house_logo" => "Gryffindor_logo"
    }

    @house = House.new(options)
  end

  def test_house_name()
    result = @house.house_name()
    assert_equal("Gryffindor", result)
  end

  def test_house_logo()
    result = @house.house_logo()
    assert_equal("Gryffindor_logo", result)
  end

end
