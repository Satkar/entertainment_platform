# This class represnets LibraryItem in the system
class LibraryItem < ApplicationRecord
  VALIDITY = 2.days

  belongs_to :user
  belongs_to :movie, foreign_key: 'gallery_item_id', optional: true
  belongs_to :season, foreign_key: 'gallery_item_id', optional: true
  belongs_to :purchase_option

  validates_presence_of :gallery_item_id, message: 'must be provided.'
end