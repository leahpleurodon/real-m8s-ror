FactoryBot.define do
  factory :house_bill do
    desc { "MyString" }
    due_date { "2018-09-04 09:37:56" }
    amount { "9.99" }
    active { true }
    association :user, factory: :author
    category { "MyString" }
    association :house, factory: :house
  end
end
