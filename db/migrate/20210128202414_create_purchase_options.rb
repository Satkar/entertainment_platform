class CreatePurchaseOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_options do |t|
      t.float :price, null: false
      t.string :video_quality, null: false

      t.timestamps
    end
  end
end
