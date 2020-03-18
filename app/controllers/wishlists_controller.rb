class WishlistsController < ApplicationController

  
  get "/wishlists/:id/new" do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :"/wishlists/new"
    else
      redirect to '/logins'
    end
  end

  
  post "/wishlists/:id" do
    if !Helpers.is_logged_in?(session)
      redirect to "/logins/login"
    end
    @user = Helpers.current_user(session)
    @wish = Wishlist.new(content: params["content"], user_id: @user.id)
    if @wish.valid?
      @wish.save
      redirect "/wishlists/#{@user.id}/index"
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

  # GET: /wishlists/5/edit
  get "/wishlists/:id/edit" do
    if !Helpers.is_logged_in?(session)
      redirect to "/logins/login"
    end
    @wish = Wishlist.find(params[:id])
    if @current_user == Helpers.current_user(session)
    erb :"/users/edit"
    else
      redirect to "/logins/login"
    end
  end

end
  # # GET: /wishlists/5
  # get "/wishlists/:id" do
  #   erb :"/wishlists/show.html"
  # end

  

  # # PATCH: /wishlists/5
  # patch "/wishlists/:id" do
  #   redirect "/wishlists/:id"
  # end

  # # DELETE: /wishlists/5/delete
  # delete "/wishlists/:id/delete" do
  #   redirect "/wishlists"
  # end

