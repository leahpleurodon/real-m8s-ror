class BillPayment < ApplicationRecord
  belongs_to :user
  belongs_to :house_bill
  has_one :house, :through => :house_bill
  validates_numericality_of :amount_due, greater_than: 0
end
