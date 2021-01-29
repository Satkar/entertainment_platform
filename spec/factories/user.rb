FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    
    trait :empty_email do
      email { nil }
    end

    trait :invalid_email do
      email { 'abc.co' }
    end

    factory :user_without_email, traits: [:empty_email]
    factory :user_with_invalid_email, traits: [:invalid_email]
  end
end