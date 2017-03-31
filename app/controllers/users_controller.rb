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

      erb :'/users/new',locals: {message: "Please do no leave any fields blank."}

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
    elsif params[:username] == "" || params[:password] == "" || params[:username] =="" || params[:neighborhood_id] == ""
        erb :'/users/login',locals: {message: "Please do no leave any fields blank."}
    else
      erb :'/users/new',locals: {message: "We cannot find that account. Please sign up."}
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/'
    else
      redirect to '/login'
    end
  end

  get '/users/:slug' do
   @user = User.find_by_slug(params[:slug])
    if logged_in?
      erb :"/users/show"
    else
      redirect to '/login'
    end
  end


end
