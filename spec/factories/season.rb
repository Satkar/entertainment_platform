FactoryBot.define do
  factory :random_season, class: "Season" do
    title { Faker::TvShows::BigBangTheory.character  }
    plot { Faker::TvShows::BigBangTheory.quote  } 
    type { 'Season' }

    after :create do |season|
      season.episodes = create_list :random_episode, 5, season: season
    end

    factory :season_with_sd_quality do
      after :create do |season|
        sd_video = create :sd_price
        create :gallery_items_purchase_option, gallery_item_id: season.id, purchase_option_id: sd_video.id
      end
    end

    factory :season_with_hd_quality do
      after :create do |season|
        hd_video = create :hd_price
        create :gallery_items_purchase_option, gallery_item_id: season.id, purchase_option_id: hd_video.id
      end
    end
  end
end