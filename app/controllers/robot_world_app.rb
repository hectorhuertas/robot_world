require 'models/robot_manager'
class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :main
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    RobotManager.create(params[:robot])
    redirect '/robots'
  end

  get '/robots' do
    @robots = RobotManager.all
    erb :index
  end

  get '/robots/:id' do |id|
    @robot = RobotManager.find(id.to_i)
    erb :show
  end


  # def call(env)
  #   [200, {'Content-type' => 'text/html'}, ["Hello, 1510!"]]
  # end
end
