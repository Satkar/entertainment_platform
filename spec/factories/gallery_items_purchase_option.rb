FactoryBot.define do
  factory :gallery_items_purchase_option, class: 'GalleryItemsPurchaseOption' do
    association :movie, factory: :random_movie
    association :purchase_option, factory: :sd_price
  end
end