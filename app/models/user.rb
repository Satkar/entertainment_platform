# This class represents a user in the system
class User < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence:true, uniqueness: true
  has_many :library_items, dependent: :destroy

  # lists all active subscriptions of user ordered by expiry date
  def library
    library_items.active_subscriptions.ordered_by_expiry.as_json(include: [:gallery_item, :purchase_option])
  end

  # Below method checks 
  # if subscription for the movie or season id not expired then returns 'false'
  # else creates a new subscription for the user
  def purchase_now(gallery_item, purchase_option)
    return false if active_subscription?(gallery_item.id, purchase_option.id)
    LibraryItem.add_subscription(self.id, gallery_item.id, purchase_option.id)
  end

  private

  def active_subscription?(gallery_item_id, purchase_option_id)
    library_items.where(
      gallery_item_id: gallery_item_id, 
      purchase_option_id: purchase_option_id
    ).active_subscriptions.present?
  end
end