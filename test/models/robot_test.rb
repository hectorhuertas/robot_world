require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_assigns_attributes_correctly
    robot = Robot.new({
      'name' => "a name",
      'birth' => "2024-02-12",
      'state' => "a state",
      'city' => "a city",
      'hired' => "2005-11-11",
      'department' => "a department",
      'id' => 1})


      assert_equal "a name", robot.name
      assert_equal "2024-02-12", robot.birth
      assert_equal "a state", robot.state
      assert_equal "a city", robot.city
      assert_equal "2005-11-11", robot.hired
      assert_equal "a department", robot.department
      assert_equal 1, robot.id
  end
end
