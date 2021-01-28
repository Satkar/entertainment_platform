FactoryBot.define do
  factory :random_episode, class: 'Episode' do
    title { Faker::TvShows::TwinPeaks.location  }
    plot  { Faker::TvShows::TwinPeaks.quote   } 
    association :season, factory: :random_season
    type { 'Episode' }
    serial_num { rand(100) }
    
    
    trait :empty_season_id do
      season_id { nil }
    end

    trait :empty_serial_num do
      serial_num { nil }
    end

    factory :episode_without_serial_num, traits: [:empty_serial_num]
    factory :episode_without_season_id, traits: [:empty_season_id]
  end
end