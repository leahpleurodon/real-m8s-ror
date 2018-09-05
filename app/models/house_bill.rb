class HouseBill < ApplicationRecord
  belongs_to :user
  belongs_to :house
  validates_numericality_of :amount, greater_than: 0
end
