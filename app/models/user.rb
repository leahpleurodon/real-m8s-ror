# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_one :mate_profile
  has_many :user_pets
  has_many :house_bills
  has_many :mate_reviews
  has_many :user_house_chores
  has_many :house_users, -> { where active: true }
  has_many :houses, :through => :house_users

  has_many :received_reviews,
           class_name: 'MateReview',
           foreign_key: 'user_id'
  has_many :written_reviews,
           class_name: 'MateReview',
           foreign_key: 'author_id'

  validates_presence_of :password_digest, :email
  validates_uniqueness_of  :email
  mount_uploader :profile_pic, ProfilePicUploader
  
  def full_name
    "#{first_name} #{last_name}"
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid)
    .first_or_initialize.tap do |user| 
      user.provider = auth.provider
      user.uid = auth.uid
      user.last_name = auth.info.last_name
      user.first_name = auth.info.first_name
      user.password = SecureRandom.hex 4
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
    MateProfile.create(user: @user)
  end
end