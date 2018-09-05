# frozen_string_literal: true

FactoryBot.define do
  factory :house_user do
    association :user, factory: :user
    is_admin { true }
    active { true }
    association :house, factory: :house
  end
end
