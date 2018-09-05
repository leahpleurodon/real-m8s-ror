# frozen_string_literal: true

FactoryBot.define do
  factory :house do
    house_type { 'unit' }
    address { '14 Charming Ave, Reservoir' }
    state { 'Victoria' }
    country { 'Aus' }
    rent_cycle { 'monthly' }
    rent_start_date { '2015-09-03 20:05:36' }
    join_code { 'TOI509R5' }
    rent { 450.0 }
    code_expiry_date { '2018-09-03 20:05:36' }
    bio { 'Our house, is our castle and our keep...' }
  end
end
