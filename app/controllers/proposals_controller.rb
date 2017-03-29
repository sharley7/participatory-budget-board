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
     if params[:title] == "" || params[:content] == "" || params[:neighborhood_id] == ""
         @proposal = Proposal.create(title: params[:title], content: params[:content], neighborhood_id: params[:neighborhood_id], user_id: params[:user_id])}
         redirect to '/proposals'
      else
        redirect to '/proposals/new'
   end
 end

end
