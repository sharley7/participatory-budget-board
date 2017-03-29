class Neighborhood < ActiveRecord::Base
has_many :proposals
has_many :neighborhood_proposals
has_many :users, through: :neighborhood_proposals


end
