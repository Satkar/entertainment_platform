FactoryBot.define do
  factory :gallery_item do
    title { "The Usual Suspects" }
    plot { "A sole survivor tells of the twisty events leading up to a horrific gun battle on a boat, which began when five criminals met at a seemingly random police lineup." }
    
    trait :empty_plot do 
      plot { nil }
    end

    trait :empty_title do 
      title { nil }
    end
  
    factory :gallery_item_with_empty_plot, traits: [:empty_plot]
    factory :gallery_item_with_empty_title, traits: [:empty_title]
  
    factory :random_movie do 
      title { Faker::Movie.title }
      plot { Faker::Movie.quote }
      type { 'Movie' }
    end
  
    factory :random_season do
      title { Faker::TvShows::BigBangTheory.character  }
      plot { Faker::TvShows::BigBangTheory.quote  } 
      # type { 'Season' }
    end
  end

end