class WishlistsController < ApplicationController

  
  get "/wishlists/:user_id/new" do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :"/wishlists/new"
    else
      redirect to '/logins'
    end
  end

  # GET: /wishlists/5
 

  
  post "/wishlists/:id" do
    if !Helpers.is_logged_in?(session)
      redirect to "/logins/login"
    end
    @user = Helpers.current_user(session)
    @wish = Wishlist.new(content: params["content"], user_id: @user.id)
    if @wish.valid?
      @wish.save
      redirect to "/wishlists/#{@user.id}/index"
    else
      redirect to "/wishlists/#{@user.id}/new"
    end
  end

  get '/wishlists/:id/index' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      @wishlists = @user.wishlists
      erb :'/wishlists/index'
    else
      redirect to '/logins'
    end
  end

  get "/wishlists/:id" do
    if !Helpers.is_logged_in?(session)
      redirect to "/logins/login"
    end
    @wish = Wishlist.find(params[:id])
    erb :"/wishlists/show"
  end

  get "/wishlists/:id/edit" do
    @user = Helpers.current_user(session)
    if !Helpers.is_logged_in?(session)
      redirect to "/logins/login"
    end
    @wish = Wishlist.find_by(id: params[:id])    
    if @wish.user == Helpers.current_user(session)
        erb :"/wishlists/edit"
    else
      redirect to "/logins/login"
    end
  end

  patch "/wishlists/:id/edit" do
    @wish = Wishlist.find_by(id: params[:id])
    if params[:content].empty?
      redirect to "/wishlists/#{@wish.id}/edit"
    else    
      @wish.update(content: params[:content])
      redirect to "/wishlists/#{@current_user.id}/index"
    end
  end

  delete '/wishlists/:id/delete' do    
    user = Helpers.current_user(session)
    if Helpers.is_logged_in?(session)
      @wish = Wishlist.find_by(id: params[:id])
      if @wish.user == Helpers.current_user(session)
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

end
  

  # if params[:password].blank?
    #     params.delete(:password)
    # end

  

