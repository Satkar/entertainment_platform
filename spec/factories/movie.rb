FactoryBot.define do
  factory :random_movie, class: 'Movie' do
    title { Faker::Movie.title }
    plot { Faker::Movie.quote }
    type { 'Movie' }
    
    
    factory :movie_with_sd_quality do
      after :create do |movie|
        sd_video = create :sd_price
        create :gallery_items_purchase_option, gallery_item_id: movie.id, purchase_option_id: sd_video.id
      end
    end

    factory :movie_with_hd_quality do
      after :create do |movie|
        hd_video = create :hd_price
        create :gallery_items_purchase_option, gallery_item_id: movie.id, purchase_option_id: hd_video.id
      end
    end

  end
end
