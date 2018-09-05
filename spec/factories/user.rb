# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'leah' }
    last_name { 'eramo' }
    gender { 'female' }
    username { 'leahpleurodon' }
    dob { '13/03/1991' }
    active { true }
    email { 'schmooey@email.com' }
    password { 'pudding' }
  end

end
