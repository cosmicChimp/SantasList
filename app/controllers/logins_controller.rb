class LoginsController < ApplicationController

  # GET: /logins/new
  get '/signups/signup' do
    erb :"/signups/signup"
  end

  post '/signups' do
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect to "/users/:id"
    else
      flash[:message] = "Missing Signup Field, Please Try Again"      
      redirect to "/signups/signup"
    end
  end

  get '/logins/login' do
    if Helpers.is_logged_in?(session)
      redirect to "/users/:id"
    else 
      flash[:login_error] = "Login Info Incorrect.  Please try again."
    end
    erb :'/logins/login'
  end

  post '/logins' do
    
    @user = User.find_by(email: params[:email])
    # raise params.inspect
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/users/:id"
    end
    erb :"/logins/login"
  end
   
  get "/logins/signup" do
    if Helpers.is_logged_in?(session)
      redirect to "/users/home"
    end
    redirect to "/logins"
  end

  
    get '/logout' do
      @user = User.find_by_id(params[:id])
      if Helpers.is_logged_in?(session)
        session.clear
        redirect to '/logins/login'
      else
        redirect to '/'
      end
    end

end

  