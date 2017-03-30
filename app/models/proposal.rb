class Proposal < ActiveRecord::Base
belongs_to :user
belongs_to :neighborhood
belongs_to :neighborhood_proposals


  def vote
    self.vote_total += 1
  end

end
