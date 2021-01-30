# This class represnets LibraryItem in the system
class LibraryItem < ApplicationRecord
  VALIDITY = 3.days

  belongs_to :user
  belongs_to :movie, foreign_key: 'gallery_item_id', optional: true
  belongs_to :season, foreign_key: 'gallery_item_id', optional: true
  belongs_to :purchase_option

  belongs_to :gallery_item

  validates_presence_of :gallery_item_id, message: 'must be provided.'

  scope :active_subscriptions, -> { where('expires_at > ?', DateTime.now) }
  scope :ordered_by_expiry, -> { order('expires_at asc') }

  # creates a new subscription for user
  def self.add_subscription(user_id, gallery_item_id, purchase_option_id)
    create!(
      user_id: user_id,
      gallery_item_id: gallery_item_id,
      purchase_option_id: purchase_option_id, 
      expires_at: Time.now + VALIDITY
    )
  end

  # calculates remaining time for the subscription to expire
  def calculate_remaining_time
    expiry_time = expires_at.to_i
    current_time = DateTime.now.to_i
    if current_time < expiry_time
      message = ActiveSupport::Duration.build(expiry_time - current_time).parts
      duration = ''
      duration += "#{message[:days]} day/s " if message[:days] > 0
      duration += "#{message[:hours]} hour/s " if message[:hours] > 0
      duration += "#{message[:minutes]} minute/s" if message[:minutes] > 0
      duration
    end
  end
end