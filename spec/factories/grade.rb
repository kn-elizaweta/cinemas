FactoryBot.define do
  factory :grade do
    rating { rand(1..10) }
    association(:movie)
    association(:user)
  end
end