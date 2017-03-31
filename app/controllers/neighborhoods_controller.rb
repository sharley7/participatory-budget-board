class NeighborhoodsController < ApplicationController

  get '/neighborhoods' do
    @neighborhoods = Neighborhood.all
    erb :'/neighborhoods/neighborhoods'
  end


end
