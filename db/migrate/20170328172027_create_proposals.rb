class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals do |f|
      f.string :title
      f.string :content
      f.integer :user_id
      f.integer :neighborhood_id
      f.integer :vote_total, default: 0
    end
  end
end
