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
    if logged_in?
     @proposal = Proposal.find_by(id: params[:id])
     erb :'/proposals/show'
   else
     redirect to '/'
   end
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
     if logged_in? && session[:user_id] == @proposal.user.id
       erb :'/proposals/edit'
     else
       redirect to "/proposals/#{@proposal.id}"
    end
 end

 post '/proposals/:id/edit' do
   @proposal = Proposal.find_by(id: params[:id])
   if params[:title] == "" || params[:content] == "" || params[:neighborhood_id] == ""
     erb :'/proposals/edit', locals: {message: "Please do no leave any fields blank."}
   else
    @proposal.update
    redirect to "/proposal/#{@proposal.id}"
   end
  end

 delete '/proposals/:id/delete' do
   @proposal = Proposal.find_by(id: params[:id])
   if logged_in? && session[:user_id] == @proposal.user.id
      @proposal = Proposal.find_by(id: params[:id])
      @proposal.delete
      redirect to '/proposals'
    else
      redirect to "/proposal/#{@proposal.id}"
    end
  end

  post '/proposals/:id/vote' do
   if logged_in?
      @proposal = Proposal.find_by(id: params[:id])
      @proposal.vote
      @proposal.save
      redirect to "/proposals"
    else
      redirect to "/proposals"
    end
  end

  get '/proposals' do
   if logged_in?
    @proposals = Proposal.all
    erb :'/proposals/proposals'
   else
    redirect to '/'
   end
  end

end
