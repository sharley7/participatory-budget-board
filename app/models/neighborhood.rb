class Neighborhood < ActiveRecord::Base
has_many :users
has_many :neighborhood_proposals
has_many :proposals, through: :neighborhood_proposals


end
