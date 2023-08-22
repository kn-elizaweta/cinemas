FactoryBot.define do
  factory :cinema do
    movies { [association(:movie)] }
    name { Faker::Movies::HarryPotter.character.split(' ').first }
    cinema_hall_count { rand(1..10) }
    location { Faker::Address.street_address }
  end
end
