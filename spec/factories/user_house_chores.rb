FactoryBot.define do
  factory :user_house_chore do
    association :user, factory: :user 
    association :house, factory: :house
    association :chore, factory: :chore
    day_of_week { "Sunday" }
    frequency { "Weekly" }
    active { true }
  end
end
