require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  def create_robots(n)
    n.times do |i|
      RobotManager.create({
        :name       => "a name#{i+1}",
        :birth      => "2024-02-12",
        :state      => "a state",
        :city       => "a city",
        :hired      => "2005-11-11",
        :department => "a department"})
    end
  end

  def test_it_creates_a_Robot
    create_robots(1)

    robot = RobotManager.all.last

    assert_equal "a name1",       robot.name
    assert_equal "2024-02-12",    robot.birth
    assert_equal "a state",       robot.state
    assert_equal "a city",        robot.city
    assert_equal "2005-11-11",    robot.hired
    assert_equal "a department",  robot.department
  end

  def test_it_finds_all_robots
    create_robots(2)

    assert_equal 2,         RobotManager.all.size
    assert_equal "a name1", RobotManager.all.first.name
    assert_equal "a name2", RobotManager.all.last.name
  end

  def test_it_finds_robots
    create_robots(2)
    id1 = RobotManager.all.first.id
    id2 = RobotManager.all.last.id

    robot1 = RobotManager.find(id1)
    robot2 = RobotManager.find(id2)

    assert_equal "a name1", robot1.name
    assert_equal "a name2", robot2.name
  end

  def test_it_updates_a_robot
    create_robots(1)
    id = RobotManager.all.last.id

    RobotManager.update(id,{
      :name       => "a name UP",
      :birth      => "2024-02-12 UP",
      :state      => "a state UP",
      :city       => "a city UP",
      :hired      => "2005-11-11 UP",
      :department => "a department UP"})

    robot = RobotManager.all.last
    assert_equal "a name UP",        robot.name
    assert_equal "2024-02-12 UP",    robot.birth
    assert_equal "a state UP",       robot.state
    assert_equal "a city UP",        robot.city
    assert_equal "2005-11-11 UP",    robot.hired
    assert_equal "a department UP",  robot.department
  end

  def test_it_deletes_a_robot
    create_robots(2)

    assert_equal 2,  RobotManager.all.size

    RobotManager.delete(RobotManager.all.first.id)

    assert_equal 1,         RobotManager.all.size
    assert_equal "a name2", RobotManager.all.last.name
  end
end
