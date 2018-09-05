# frozen_string_literal: true

FactoryBot.define do
  factory :user_pet do
    name { 'Murphay' }
    species { 'Dog' }
    size { 'Large' }
    people_friendly { true }
    child_friendly { true }
    pet_friendly { false }
    active { true }
    bio { 'Murphy might maul your small dog or cat, other than that he is fine.' }
    association :user, factory: :user
  end
end
