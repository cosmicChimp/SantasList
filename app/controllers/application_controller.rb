require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET'] { SecureRandom.hex(64) }
  end

  get "/" do
    session[:user_id] = user.id
    erb "users/welcome"
  end

  get '/color' do
    session[:whatever]
  end

end