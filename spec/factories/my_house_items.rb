# frozen_string_literal: true

FactoryBot.define do
    factory :my_bill, class: HouseBill  do
        desc { "MyString" }
        due_date { "2018-09-04 09:37:56" }
        amount { "9.99" }
        active { true }
        # association :user, factory: :author
        category { "MyString" }
        # association :house, factory: :house
        factory :bill_with_house do
            after(:create) do |house|
            create(:my_bill_payment, house: house)
            end
        end

    end
      
      factory :my_bill_payment, class: BillPayment do 
        amount_due { "9.99" }
        paid { false }
        due_date { "2018-09-04 10:01:02" }
        active { true }
        factory :bill_payment_with_bill do
            after(:create) do |my_bill, user|
            create(:my_bill_payment, house_bill: my_bill, user: user)
            end
        end
      end


end
  