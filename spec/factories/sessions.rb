FactoryBot.define do
  factory :session do
    viewers_count { rand(0..50) }
    time { ["10:00", "12:30", "15:00", "17:00", "19:40", "21:20", "23:00"].sample }
    price { rand(200..800) }
    date { Faker::Date.between(from: '2023-01-01', to: '2024-01-01')}
    association(:movie)
    association(:cinema)
  end
end