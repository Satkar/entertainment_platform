class CreateGalleryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :gallery_items do |t|
      t.string :title, null: false
      t.text :plot, null: false
      t.string :type
      t.timestamps
    end
  end
end
