class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.integer :user_id
      t.string :public_key
      t.string :access_token

      t.timestamps
    end
  end
end
