class LoginsController < ApplicationController

  # GET: /logins/new
  get '/signup' do
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

  get '/login' do
    if is_logged_in?
      redirect to "/users/#{current_user.id}/home"
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
      redirect to "/users/#{@user.id}/home"
    end
    erb :"/logins/login"
  end
   
  get "/logins/signup" do
    if is_logged_in?
      redirect to "/users/home"
    end
    redirect to "/logins"
  end

  
    get '/logout' do
      if is_logged_in?
        session.clear
        redirect to '/login'
      else
        redirect to '/'
      end
    end

end

  