class LettersController < ApplicationController

  # GET: /letters
  get "/letters" do
    erb :"/letters/index.html"
  end

  # GET: /letters/new
  get "/letters/new" do
    erb :"/letters/new.html"
  end

  # POST: /letters
  post "/letters" do
    redirect "/letters"
  end

  # GET: /letters/5
  get "/letters/:id" do
    erb :"/letters/show.html"
  end

  # GET: /letters/5/edit
  get "/letters/:id/edit" do
    erb :"/letters/edit.html"
  end

  # PATCH: /letters/5
  patch "/letters/:id" do
    redirect "/letters/:id"
  end

  # DELETE: /letters/5/delete
  delete "/letters/:id/delete" do
    redirect "/letters"
  end
end
