# This class represnets GalleryItemsPurchaseOptions in the system
class GalleryItemsPurchaseOption < ApplicationRecord
  belongs_to :movie, foreign_key: 'gallery_item_id', optional: true
  belongs_to :season, foreign_key: 'gallery_item_id', optional: true
  belongs_to :purchase_option
end
  