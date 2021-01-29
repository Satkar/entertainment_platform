class CreateLibraryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :library_items do |t|
      t.integer :user_id, null: false
      t.integer :gallery_item_id, null: false
      t.integer :purchase_option_id, null: false
      t.datetime :expires_at, null: false
    end

    add_index :library_items, [
      :user_id, :gallery_item_id, :purchase_option_id
      ], unique: true, name: 'index_library_items'
  end
end
