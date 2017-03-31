class Neighborhood < ActiveRecord::Base
has_many :users
has_many :proposals


end
