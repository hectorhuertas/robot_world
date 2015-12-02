class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :index
  end

  # def call(env)
  #   [200, {'Content-type' => 'text/html'}, ["Hello, 1510!"]]
  # end
end
