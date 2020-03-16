class UsersController < ApplicationController

  

  # GET: /users/5
  get "/users/home" do
    @current_user = User.find(session[:user_id])
    erb :"/users/home"
  end


  # get '/users/:slug' do
  #   @user = User.find_by_slug(params[:slug])
  #   erb :'/users/home'
  # end


  # # GET: /users
  # get "/users" do
  #   erb :"/users/index.html"
  # end

  # # GET: /users/new
  # get "/users/new" do
  #   erb :"/users/new.html"
  # end

  # # POST: /users
  # post "/users" do
  #   redirect "/users"
  # end

 

  # # GET: /users/5/edit
  # get "/users/:id/edit" do
  #   erb :"/users/edit.html"
  # end

  # # PATCH: /users/5
  # patch "/users/:id" do
  #   redirect "/users/:id"
  # end

  # # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end
end
