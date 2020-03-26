class UsersController < ApplicationController

  get "/users/:id" do
    @current_user = User.find(session[:user_id])
    redirect to "/users/#{@current_user.id}/home"
  end

  get "/users/:id/home" do
    if Helpers.is_logged_in?(session)
      @current_user = User.find(session[:user_id])
      erb :"/users/home"
    else
      redirect to "/"
    end
  end

  post "/users/:id/home" do
    @current_user = User.find(session[:user_id])
    redirect to "/users/#{@current_user.id}/home"
  end

  
  get "/users/:id/edit" do
    if !Helpers.is_logged_in?(session)
      redirect to "/logins/login"
    end
    @current_user = User.find(session[:user_id])
    if @current_user == Helpers.current_user(session)
    erb :"/users/edit"
    else
      redirect to "/logins/login"
    end
  end

  
  patch "/users/:id/edit" do
    @current_user = User.find(session[:user_id])
    if params[:name] && params[:email].empty?
      redirect to "/users/#{@current_user.id}/edit"
    end

    if params[:password].blank?
        params.delete(:password)
    end
      @current_user.update(name: params[:name], email: params[:email])
      @current_user.save
      redirect "/users/#{@current_user.id}/home"
  end


  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    if Helpers.is_logged_in?(session)
      @user = User.find(params[:id])
      if @user == Helpers.current_user(session)
        @user = User.find_by_id(params[:id])
        @user.delete
        redirect to "/home"
      else
        redirect to "/home"
      end
    else
      redirect to "/home"
    end
  end

end
