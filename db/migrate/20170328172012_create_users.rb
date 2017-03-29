class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |f|
      f.string :username
      f.string :email
      f.string :password_digest
      f.string :neighborhood
  end
 end
end
