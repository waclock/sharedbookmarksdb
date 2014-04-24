class CreatePreUsers < ActiveRecord::Migration
  def change
    create_table :pre_users do |t|
      t.string :email
      t.boolean :active, default: false
      t.string :location

      t.timestamps
    end
  end
end
