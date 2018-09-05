FactoryBot.define do
  factory :chore do
    name { "Washing the Dishes" }
    outdoor { false }
    active { true }
  end
end
