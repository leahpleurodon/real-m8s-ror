# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_one :mate_profile
  has_many :user_pets
  has_many :house_bills
  has_many :house_users, -> { where active: true }
  has_many :houses, :through => :house_users

  has_many :received_reviews,
           class_name: 'MateReview',
           foreign_key: 'user_id'
  has_many :written_reviews,
           class_name: 'MateReview',
           foreign_key: 'author_id'

  validates_presence_of :password_digest, :email, :username
  
  mount_uploader :profile_pic, ProfilePicUploader
  
  def full_name
    "#{first_name} #{last_name}"
  end
end