class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :link
      t.integer :folder_id
      t.integer :group_id
      t.string :name
      t.timestamps
    end
  end
end
