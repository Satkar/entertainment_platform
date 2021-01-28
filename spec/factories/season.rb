FactoryBot.define do
  factory :random_season, class: "Season" do
    title { Faker::TvShows::BigBangTheory.character  }
    plot { Faker::TvShows::BigBangTheory.quote  } 
    type { 'Season' }

    after :create do |season|
      season.episodes = create_list :random_episode, 5, season: season
    end
  end
end