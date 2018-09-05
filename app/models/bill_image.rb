class BillImage < ApplicationRecord
  belongs_to :house_bill
  has_one :house, :through => :house_bill
  mount_uploader :image, BillImageUploader
end
