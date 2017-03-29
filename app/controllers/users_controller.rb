class UsersController < ApplicationController

  get '/signup' do
    if logged_in? == false
      erb :'/users/new'
    else
      redirect to '/proposals'
    end
  end





end
