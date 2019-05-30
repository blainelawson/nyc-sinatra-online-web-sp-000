class FiguresController < ApplicationController
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  get '/figures' do
    @figures = Figure.all

    erb :index
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    binding.pry
    erb :show
  end

  post '/figures' do
    # binding.pry

    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      # binding.pry
      @figure.titles << Title.create(params[:title])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    @figure.save
  end
end
