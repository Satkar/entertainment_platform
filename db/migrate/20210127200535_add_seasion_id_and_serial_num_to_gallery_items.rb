class AddSeasionIdAndSerialNumToGalleryItems < ActiveRecord::Migration[5.2]
  def change
    add_column :gallery_items, :season_id, :integer
    add_column :gallery_items, :serial_num, :integer
  end
end
