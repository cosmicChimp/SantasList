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
      redirect to "/users/home"
    else
      flash[:message] = "Missing Signup Field, Please Try Again"      
      redirect to "/signups/signup"
    end
  end

  get '/logins/login' do
    if Helpers.is_logged_in?(session)
      redirect to '/users'
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
      redirect to "/users/home"
    end
    erb :"/logins/login"
  end
   
  get "/logins/signup" do
    if Helpers.is_logged_in?(session)
      redirect to "/users/home"
    end
    redirect to "/logins"
  end

  post '/logins' do
    @user = User.find_by(email: params["email"])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/users'
    else
      
      erb :'/logins/login'
    end
  end
  
    get '/logout' do
      if Helpers.is_logged_in?(session)
        session.clear
        redirect to '/logins/login'
      else
        redirect to '/'
      end
    end

end

  # POST: /logins
  # post "/logins" do
  #   redirect "/logins"
  # end

  # # GET: /logins/5
  # get "/logins/:id" do
  #   erb :"/logins/show.html"
  # end

  # # GET: /logins/5/edit
  # get "/logins/:id/edit" do
  #   erb :"/logins/edit.html"
  # end

  # # PATCH: /logins/5
  # patch "/logins/:id" do
  #   redirect "/logins/:id"
  # end

  # # DELETE: /logins/5/delete
  # delete "/logins/:id/delete" do
  #   redirect "/logins"
  # end
# end

  