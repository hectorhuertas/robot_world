require 'sqlite3'
require 'sequel'

environments = ["test", "development"]
environments.each do |env|
  Sequel.sqlite("db/robot_manager_#{env}.sqlite3").create_table(:robots) do
    primary_key :id
    String :name
    String :state
    String :city
    String :department
    String :birth
    String :hired
  end
  puts "Migrated #{env} environment"
end
