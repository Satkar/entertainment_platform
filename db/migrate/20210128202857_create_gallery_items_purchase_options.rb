class CreateGalleryItemsPurchaseOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :gallery_items_purchase_options do |t|
      t.integer :gallery_item_id, null: false
      t.integer :purchase_option_id, null: false
    end
    
    add_index :gallery_items_purchase_options, [
      :gallery_item_id, :purchase_option_id
      ], unique: true, name: 'index_gallery_items_purchase_options'
  end
end
