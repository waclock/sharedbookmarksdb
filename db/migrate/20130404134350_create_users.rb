class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :image
      t.string :password_salt
      t.string :password_hash
      t.boolean :active, :default => false
      t.boolean :admin, :default => false
      t.boolean :first_login, :default => true
      t.boolean :deleted, :default => false
      t.integer :sign_in_count, :default => 0
      t.datetime :last_sign_in_at
      


      t.timestamps
    end
  end
end
