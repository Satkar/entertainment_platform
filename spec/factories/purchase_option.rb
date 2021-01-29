FactoryBot.define do
  factory :sd_price, class: 'PurchaseOption' do
    video_quality { "SD" }
    price { rand(1.99...2.99) }
  end

  factory :hd_price, class: 'PurchaseOption' do
    video_quality { "HD" }
    price { rand(3.99...4.99) }
  end
end