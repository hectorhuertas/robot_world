require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  def create_robots(n)
    n.times do |i|
    RobotManager.create({
      :name => "a name#{i+1}",
      :birth => "2024-02-12",
      :state => "a state",
      :city => "a city",
      :hired => "2005-11-11",
      :department => "a department"}
                         )
    end
  end

  def test_it_creates_a_Robot
    create_robots(1)

    robot = RobotManager.all.last

    assert_equal "a name1", robot.name
    assert_equal "2024-02-12", robot.birth
    assert_equal "a state", robot.state
    assert_equal "a city", robot.city
    assert_equal "2005-11-11", robot.hired
    assert_equal "a department", robot.department
    assert_equal 1, robot.id
  end

  def test_it_finds_all_robots
    create_robots(2)

    assert_equal 2, RobotManager.all.size
    assert_equal "a name1", RobotManager.all.first.name
    assert_equal "a name2", RobotManager.all.last.name
  end

  def test_it_finds_robots
    create_robots(2)

    robot1 = RobotManager.find(1)
    robot2 = RobotManager.find(2)

    assert_equal "a name1", robot1.name
    assert_equal "a name2", robot2.name
    assert_equal 1, robot1.id
    assert_equal 2, robot2.id
  end

  def test_it_updates_a_robot
    create_robots(1)
    RobotManager.update(1,{
      :name => "a name UP",
      :birth => "2024-02-12",
      :state => "a state",
      :city => "a city",
      :hired => "2005-11-11",
      :department => "a department"}
                         )

    assert_equal "a name UP", RobotManager.all.first.name
    assert_equal 1, RobotManager.all.first.id
  end

  def test_it_deletes_a_robot
    create_robots(2)

    assert_equal 2,  RobotManager.all.size

    RobotManager.delete(1)
    assert_equal 1,  RobotManager.all.size

    robot = RobotManager.all.last
    assert_equal 2, robot.id
  end
end
