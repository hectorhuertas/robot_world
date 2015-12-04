class RobotManager
  def self.database
    if ENV["RACK_ENV"] == 'test'
      @database ||= Sequel.sqlite("db/robot_manager_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/robot_manager_development.sqlite3")
    end
  end

  def self.create(data)
    database.from(:robots).insert({
      name: data[:name],
      birth: data[:birth],
      state: data[:state],
      city: data[:city],
      hired: data[:hired],
      department: data[:department] })
  end

  def self.all
    raw_robots = database.from(:robots).to_a
    raw_robots.map { |data| Robot.new(data) }
  end

  def self.find(id)
    raw_robot = database.from(:robots).where(id: id).to_a.first
    # binding.pry
    Robot.new(raw_robot)
  end

  def self.update(id, data)
    database.from(:robots).where(id: id).update(data)
  end

  def self.delete(id)
    database.from(:robots).where(id: id).delete
    # database.transaction do
    #   database['robots'].delete_if { |robot| robot["id"] == id }
    # end
  end
  #
  # def self.delete_all
  #   database.transaction do
  #     database['robots'] = []
  #     database['total'] = 0
  #   end
  # end
end
