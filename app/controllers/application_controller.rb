require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "super_secret"
  end

  get "/" do
    erb :"/users/login"
    
  end

end
