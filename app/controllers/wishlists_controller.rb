class WishlistsController < ApplicationController

  # GET: /wishlists
  get "/wishlists" do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      redirect to "/wishlists/index"
    else
      redirect to '/logins'
    end
  end

  get '/wishlists/index' do
    erb :'/wishlists/index'
  end

  # GET: /wishlists/new
  get "/wishlists/new" do
    erb :"/wishlists/new"
  end
end
  # # POST: /wishlists
  # post "/wishlists" do
  #   redirect "/wishlists"
  # end

  # # GET: /wishlists/5
  # get "/wishlists/:id" do
  #   erb :"/wishlists/show.html"
  # end

  # # GET: /wishlists/5/edit
  # get "/wishlists/:id/edit" do
  #   erb :"/wishlists/edit.html"
  # end

  # # PATCH: /wishlists/5
  # patch "/wishlists/:id" do
  #   redirect "/wishlists/:id"
  # end

  # # DELETE: /wishlists/5/delete
  # delete "/wishlists/:id/delete" do
  #   redirect "/wishlists"
  # end

