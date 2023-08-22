FactoryBot.define do
  factory :movie do
    name { Faker::Movie.title }
    genre { ['comedy', 'drama', 'cartoon', 'tragedy', 'detective'].sample }
    duration { rand(80..180) }
  end
end
