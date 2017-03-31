class NeighborhoodsController < ApplicationController

  get '/neighborhoods' do
    @neighborhoods = Neighborhood.all
    erb :'/neighborhoods/neighborhoods'
  end

  get '/neighborhoods/:id' do
  @neighborhood = Neighborhood.find_by(id: params[:id])
  erb :"/neighborhoods/show"
  end


end
