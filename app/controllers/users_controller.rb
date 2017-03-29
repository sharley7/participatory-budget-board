class UsersController < ApplicationController

  get '/signup' do
    if logged_in? == false
      erb :'/users/new'
    else
      redirect to '/proposals'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" | params[:password] == "" || params[:neighborhood_id] == ""
       redirect to '/signup'
    else
      @user = User.new(username: params[:username], email: params[:email], password: params[:password], neighborhood_id: params[:neighborhood_id]
      @user.save
      session[:user_id] = @user.id
      redirect to '/proposals'
    end
  end




end
