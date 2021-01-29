# This class represnets PurchaseOptions in the system
class PurchaseOption < ApplicationRecord
  has_many :gallery_items_purchase_options, foreign_key: 'purchase_option_id', dependent: :destroy
  has_many :movies, through: :gallery_items_purchase_options, foreign_key: 'gallery_item_id'
  has_many :seasons, through: :gallery_items_purchase_options, foreign_key: 'gallery_item_id'
end
  