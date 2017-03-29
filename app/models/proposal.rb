class Proposal < ActiveRecord::Base
belongs_to :user
belongs_to :neighborhood


  def self.vote
    self.vote_total += 1
  end

end
