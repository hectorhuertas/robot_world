require_relative '../test_helper'

class UserCreatesARobot < FeatureTest
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

  def test_robot_is_created
    visit '/robots/new'
    fill_in('robot[name]', :with => 'name1')
    fill_in('robot[birth]', :with => 'birth')
    fill_in('robot[state]', :with => 'state')
    fill_in('robot[city]', :with => 'city')
    fill_in('robot[hired]', :with => 'hired')
    fill_in('robot[department]', :with => 'department')
    click_button 'Submit'

    assert_equal '/robots', current_path
    within('#1') do
      assert page.has_content?('name1')
    end
  end

  def test_robot_is_updated
    create_robots(1)

    visit '/robots'
    find('#1').click_link('Edit')
    fill_in('robot[name]', :with => 'name1 UP')
    fill_in('robot[city]', :with => 'city UP')
    click_button 'Submit'

    assert_equal '/robots/1', current_path
    assert page.has_content?('name1 UP')
    assert page.has_content?('city UP')
  end

  def test_it_deletes_task
    create_robots(1)

    visit '/robots'
    find('#1').click_button 'Delete'
  
    refute page.has_css?('#1')
  end
end
