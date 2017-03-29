require 'pry'
class ProposalsController < ApplicationController


   get '/proposals/:id' do
     @proposal = Proposal.find_by(id: params[:id])
     erb :'/proposals/show'
   end

   get '/proposals/new' do
     if logged_in?
       erb :'/proposals/new'
     else
       redirect to '/proposals'
     end
   end

      get '/proposals' do
        erb :'/proposals/proposals'
      end

   post '/proposals' do
     if params[:title] == "" || params[:content] == "" || params[:neighborhood_id] == ""
         redirect to '/proposals/new'
      else
        @proposal = Proposal.create(title: params[:title], content: params[:content], neighborhood_id: params[:neighborhood_id], user_id: params[:user_id])
        redirect to "/proposals/#{@proposal.id}"
   end
 end

 get '/proposal/:id/edit' do
   @proposal = Proposal.find_by(id: params[:id])
 end

 post '/proposal/:id/edit' do

   if params[:title] == "" || params[:content] == "" || params[:neighborhood_id] == ""
     redirect to "/proposal/#{@proposal.id/edit}"
  else
    @proposal.update
    redirect to "/proposal/#{@proposal.id}"
  end
 end


  post '/vote' do
    @proposal = find_by(params[:proposal_id])
    @proposal.vote
    redirect to '/proposals'
  end

end
