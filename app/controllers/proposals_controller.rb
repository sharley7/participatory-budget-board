class ProposalsController < ApplicationController

   get '/proposals' do
    if logged_in?
     erb: '/proposals/proposals'
   else
     redirect to '/signup'
     end
   end 


end
