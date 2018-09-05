# frozen_string_literal: true

class House < ApplicationRecord
  has_many :house_users, -> { where active: true }
  has_many :users, :through => :house_users
  has_many :house_bills
  validates_numericality_of :rent, greater_than: 0
  mount_uploader :profile_pic, ProfilePicUploader
end
