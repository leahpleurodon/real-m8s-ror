FactoryBot.define do
  factory :bill_payment do
    association :user, factory: :user
    amount_due { "9.99" }
    paid { false }
    due_date { "2018-09-04 10:01:02" }
    active { true }
    association :house_bill, factory: :house_bill
  end
end
