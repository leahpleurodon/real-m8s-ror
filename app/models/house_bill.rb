class HouseBill < ApplicationRecord
  belongs_to :user
  belongs_to :house
  has_many :bill_payments
  has_many :bill_images
  validates_numericality_of :amount, greater_than: 0  
end
