class UsersController < ApplicationController

  get '/signup' do
    if logged_in? == false
      erb :'/users/new'
    else
      redirect to '/proposals'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == "" || params[:neighborhood_id] == ""

      redirect to '/signup'

    else
      @user = User.new(username: params[:username], email: params[:email], password: params[:password], neighborhood_id: params[:neighborhood_id])
      @user.save
      session[:user_id] = @user.id
      redirect to '/proposals'
    end
  end

  get '/login' do
    if logged_in?
      redirect to '/proposals'
    else
      erb :'/users/login'
    end
   end

   post '/login' do
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/proposals"
    else
      redirect to '/signup'
    end
  end

  post '/logout' do
    if logged_in?
      session.clear
      redirect to '/'
    else
      redirec to '/login'
    end
  end






end
