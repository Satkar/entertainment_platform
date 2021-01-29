# This class represnets LibraryItem in the system
class LibraryItem < ApplicationRecord
  VALIDITY = 2.days

  belongs_to :user
  belongs_to :movie, foreign_key: 'gallery_item_id', optional: true
  belongs_to :season, foreign_key: 'gallery_item_id', optional: true
  belongs_to :purchase_option

  belongs_to :gallery_item

  validates_presence_of :gallery_item_id, message: 'must be provided.'

  scope :active_subscriptions, -> { where('expires_at > ?', DateTime.now) }
  scope :ordered_by_expiry, -> { order('expires_at asc') }

  def self.add_subscription(user_id, gallery_item_id, purchase_option_id)
    create!(
      user_id: user_id,
      gallery_item_id: gallery_item_id,
      purchase_option_id: purchase_option_id, 
      expires_at: Time.now + VALIDITY
    )
  end
end