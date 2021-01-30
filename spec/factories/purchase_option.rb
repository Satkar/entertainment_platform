FactoryBot.define do
  factory :sd_price, class: 'PurchaseOption' do
    video_quality { "SD" }
    price { rand(1.99...2.99).round(2) }
  end

  factory :hd_price, class: 'PurchaseOption' do
    video_quality { "HD" }
    price { rand(1.99...2.99).round(2) }
  end
end