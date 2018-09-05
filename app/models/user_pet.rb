# frozen_string_literal: true

class UserPet < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :species
  mount_uploader :profile_pic, ProfilePicUploader
end
