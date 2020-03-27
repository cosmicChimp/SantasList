require './config/environment'
require "rack-flash"
require 'console'
require 'dotenv'
require_relative '../helpers/helper'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }
  # enable :sessions
  # use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    use Rack::Flash
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET'] { SecureRandom.hex(64) }
    helpers Sinatra::Helpers
  end

  get "/" do
    erb :home
  end

  

end