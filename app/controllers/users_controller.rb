class UsersController < ApplicationController

  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end


end
