require 'pry'
class ProposalsController < ApplicationController

   get '/proposals' do
     erb :'/proposals/proposals'
   end

   get '/proposals/new' do
     if logged_in?
       erb :'/proposals/new'
     else
       redirect to '/proposals'
     end
   end

   post '/proposals' do
     binding.pry
     redirect to '/proposals'
   end

end
