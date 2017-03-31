require 'pry'
class ProposalsController < ApplicationController

  get '/proposals/new' do
    if logged_in?
      erb :'/proposals/new'
    else
      redirect to '/proposals'
    end
  end

   get '/proposals/:id' do
     @proposal = Proposal.find_by(id: params[:id])
     erb :'/proposals/show'
   end


   post '/proposals' do
     if params[:title] == "" || params[:content] == "" || params[:neighborhood_id] == ""
         erb :'/proposals/new', locals: {message: "Please do no leave any fields blank."}
      else
        @proposal = Proposal.create(title: params[:title], content: params[:content], neighborhood_id: params[:neighborhood_id], user_id: params[:user_id])
        redirect to "/proposals/#{@proposal.id}"
   end
 end

 get '/proposals/:id/edit' do
   @proposal = Proposal.find_by(id: params[:id])
   erb :'/proposals/edit'
 end

 post '/proposals/:id/edit' do
   if params[:title] == "" || params[:content] == "" || params[:neighborhood_id] == ""
     erb :"/proposal/#{@proposal.id/edit}" , locals: {message: "Please do no leave any fields blank."}
  else
    @proposal.update
    redirect to "/proposal/#{@proposal.id}"
  end
 end

 delete '/proposals/:id/delete' do
   @proposal = Proposal.find_by(id: params[:id])
   @proposal.delete
   redirect to '/proposals'
 end

  post '/proposals/:id/vote' do
    @proposal = Proposal.find_by(id: params[:id])
    @proposal.vote
    @proposal.save
    redirect to "/proposals/#{@proposal.id}"
  end

  get '/proposals' do
    @proposals = Proposal.all
    erb :'/proposals/proposals'
  end

end
