class CreateNeighborhoodProposals < ActiveRecord::Migration[5.0]
    def change
      create_table :neighborhood_proposals do |f|
        f.integer :neighborhood_id
        f.integer :proposal_id
      end 
    end
  end
