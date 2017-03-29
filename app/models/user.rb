class User < ActiveRecord::Base
has_many :proposals
belongs_to :neighborhood

  has_secure_password
end 
