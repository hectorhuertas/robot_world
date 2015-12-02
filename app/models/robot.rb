class Robot
  attr_reader :id,
              :avatar,
              :name,
              :birth,
              :state,
              :city,
              :hired,
              :department
  def initialize(data)
    @id   = data['id']
    @avatar = "https://robohash.org/#{data['id']}"
    @name = data['name']
    @birth = data['birth']
    @state = data['state']
    @city = data['city']
    @hired = data['hired']
    @department = data['department']
  end
end
