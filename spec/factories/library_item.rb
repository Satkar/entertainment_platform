FactoryBot.define do
  factory :library_item, class: 'LibraryItem' do
    gallery_item_id { (create :random_movie).id }
    association :purchase_option, factory: :sd_price
    association :user
    expires_at { Time.now + LibraryItem::VALIDITY}
    
    trait :empty_gallery_item_id do
      gallery_item_id { nil }
    end

    trait :empty_purchase_option_id do
      purchase_option_id { nil }
    end

    trait :empty_user_id do
      user_id { nil }
    end

    factory :library_item_without_gallery_item, traits: [:empty_gallery_item_id]
    factory :library_item_without_purchase_option, traits: [:empty_purchase_option_id]
    factory :library_item_without_user, traits: [:empty_user_id]
    
  end
end