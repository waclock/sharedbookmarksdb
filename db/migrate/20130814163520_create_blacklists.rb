class CreateBlacklists < ActiveRecord::Migration
  def change
    create_table :blacklists do |t|
      t.string :email_to
      t.string :email_from
      t.boolean :global

      t.timestamps
    end
  end
end
