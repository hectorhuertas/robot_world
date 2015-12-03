require 'yaml/store'

class RobotManager
  def self.database
    @database ||= YAML::Store.new('db/robot_manager')
  end

  def self.create(data)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << {
'id' => database['total'],
'name' => data[:name],
'birth' => data[:birth],
'state' => data[:state],
'city' => data[:city],
'hired' => data[:hired],
'department' => data[:department]
}
    end
  end

  def self.all
    raw_robots.map { |data| Robot.new(data) }
  end

  def self.raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def self.raw_robot(id)
    raw_robots.find { |robot| robot['id']==id}
  end

  def self.find(id)
    Robot.new(raw_robot(id))
  end

  def self.update(id, data)
    database.transaction do
      target = database['robots'].find { |data| data["id"] == id }
      target["name"] = data[:name]
      target["birth"] = data[:birth]
      target["state"] = data[:state]
      target["city"] = data[:city]
      target["hired"] = data[:hired]
      target["department"] = data[:department]
    end
  end

  def self.delete(id)
    database.transaction do
      database['robots'].delete_if { |robot| robot["id"] == id }
    end
  end
end
