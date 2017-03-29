class CreateNeighborhood < ActiveRecord::Migration[5.0]
  def change
    create_table :neighborhoods do |f|
      f.string :name
    end
  end
end
