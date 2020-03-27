class UsersController < ApplicationController


  get "/users/:id/home" do
    if is_logged_in?
      @current_user = current_user
      erb :"/users/home"
    else
      redirect to "/"
    end
  end

  post "/users/:id/home" do
    redirect to "/users/#{current_user}.id}/home"
  end

  
  get "/users/:id/edit" do
    if !is_logged_in?
      redirect to "/logins/login"
    end
    @current_user = current_user
    if @current_user.id == params[:id]
    erb :"/users/edit"
    else
      redirect to "/logins/login"
    end
  end

  
  patch "/users/:id/edit" do
    @current_user = current_user
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
    if is_logged_in?
      if current_user.id == params[:id]
        current_user.delete
      end
    end
    redirect to "/home"
  end

end
