class ProposalsController < ApplicationController

   get '/proposals' do
     erb :'/proposals/proposals'
   end

   get '/new' do
     if logged_in?
       erb :'/proposals/new'
     else
       redirect to '/proposals'
     end
   end

   post '/proposals' do
     redirect to '/proposals'
   end

end
