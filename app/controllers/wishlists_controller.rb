class WishlistsController < ApplicationController

  
  get "/wishlists/:user_id/new" do
    if is_logged_in?
      @user = current_user
      erb :"/wishlists/new"
    else
      redirect to '/logins'
    end
  end 

  
  post "/wishlists/:id" do
    if !is_logged_in?
      redirect to "/logins/login"
    end
    @user = current_user
    @wish = Wishlist.new(content: params["content"], user_id: @user.id)
    if @wish.valid?
      @wish.save
      redirect to "/wishlists/#{@user.id}/index"
    else
      redirect to "/wishlists/#{@user.id}/new"
    end
  end

  get '/wishlists/:id/index' do
    if is_logged_in?
      @user = current_user
      @wishlists = @user.wishlists
      erb :'/wishlists/index'
    else
      redirect to '/logins'
    end
  end

  get "/wishlists/:id" do
    if !is_logged_in?
      redirect to "/logins/login"
    end
    @wish = Wishlist.find(params[:id])
    erb :"/wishlists/show"
  end

  get "/wishlists/:id/edit" do
    @user = current_user
    if !is_logged_in?
      redirect to "/logins/login"
    end
    @wish = Wishlist.find_by(id: params[:id])    
    if @wish.user == current_user
        erb :"/wishlists/edit"
    else
      redirect to "/logins/login"
    end
  end

  patch "/wishlists/:id" do
    @user = current_user
    @wish = Wishlist.find_by(id: params[:id])
    if params[:content].empty?
      erb :"/wishlists/edit"
    elsif @wish.user == current_user
      @wish.update(content: params[:content])
      redirect to "/wishlists/#{current_user.id}/index"
    else
      redirect to "/users/home"
    end
  end

  delete '/wishlists/:id/delete' do    
    user = current_user
    if is_logged_in?
      @wish = Wishlist.find_by(id: params[:id])
      if @wish.user == current_user
        @wish = Wishlist.find_by_id(params[:id])
        @wish.delete
        redirect to "/wishlists/#{user.id}/index"
      else
        redirect to "/wishlists/#{user.id}/index"
      end
    else
      redirect to "/logins/login"
    end
  end

  get "/search" do
    @content = Wishlist.all
    if params[:search]
      @query = params[:search]
      @user = current_user
      @wishlists = @user.wishlists
      @result = @content.select { |x| x.content.split(" ").include?(params[:search]) }
      erb :"wishlists/index"
    end
  end
    

end
  