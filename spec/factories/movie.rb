FactoryBot.define do
  factory :random_movie, class: 'Movie' do
    title { Faker::Movie.title }
    plot { Faker::Movie.quote }
    type { 'Movie' }
  end
end
