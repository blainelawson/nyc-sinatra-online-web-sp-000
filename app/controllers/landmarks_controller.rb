class LandmarksController < ApplicationController
  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    erb :"/landmarks/#{params[:id]}"
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    redirect "/landmarks/#{@landmark.id}"
  end
end
