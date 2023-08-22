FactoryBot.define do
  factory :viewer do
  booking { [true, false].sample }
  bought { true }
  association(:user)
  end
end