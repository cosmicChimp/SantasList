class WishlistsController < ApplicationController

  # GET: /wishlists
  get "/wishlists" do
    erb :"/wishlists/index.html"
  end

  # GET: /wishlists/new
  get "/wishlists/new" do
    erb :"/wishlists/new.html"
  end

  # POST: /wishlists
  post "/wishlists" do
    redirect "/wishlists"
  end

  # GET: /wishlists/5
  get "/wishlists/:id" do
    erb :"/wishlists/show.html"
  end

  # GET: /wishlists/5/edit
  get "/wishlists/:id/edit" do
    erb :"/wishlists/edit.html"
  end

  # PATCH: /wishlists/5
  patch "/wishlists/:id" do
    redirect "/wishlists/:id"
  end

  # DELETE: /wishlists/5/delete
  delete "/wishlists/:id/delete" do
    redirect "/wishlists"
  end
end
