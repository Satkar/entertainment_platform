FactoryBot.define do
  factory :gallery_item do
    title { Faker::Movie.title }
    plot { Faker::Movie.quote }
    
    trait :empty_plot do 
      plot { nil }
    end

    trait :empty_title do 
      title { nil }
    end
  
    factory :gallery_item_with_empty_plot, traits: [:empty_plot]
    factory :gallery_item_with_empty_title, traits: [:empty_title]
  end

end