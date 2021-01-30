# This class represents a user in the system
class User < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence:true, uniqueness: true
  has_many :library_items, dependent: :destroy

  # lists all active subscriptions of user ordered by expiry date
  def library
    library_items.active_subscriptions.ordered_by_expiry.includes(:gallery_item, :purchase_option)
  end

  # Below method checks 
  # if subscription for the movie or season id not expired then returns 'false'
  # else creates a new subscription for the user
  def purchase_now(gallery_item, purchase_option)
    remaining_time = active_subscription_remaining_time(gallery_item.id, purchase_option.id)
    return remaining_time if remaining_time.present?
    LibraryItem.add_subscription(self.id, gallery_item.id, purchase_option.id)
    true
  end

  private

  def active_subscription_remaining_time(gallery_item_id, purchase_option_id)
    list = library_items.where(
      gallery_item_id: gallery_item_id, 
      purchase_option_id: purchase_option_id
    ).active_subscriptions
    return nil if list.empty?
    list.last.calculate_remaining_time
  end
end