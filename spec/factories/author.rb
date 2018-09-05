# frozen_string_literal: true

FactoryBot.define do
  factory :author, class: User do
    first_name { 'paul' }
    last_name { 'eramo' }
    gender { 'male' }
    username { 'paulie' }
    dob { '26/07/1958' }
    active { true }
    email { 'p.eramo@email.com' }
    password { 'pudding' }
  end
end
