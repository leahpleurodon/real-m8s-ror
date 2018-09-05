# frozen_string_literal: true

class MateProfile < ApplicationRecord
  belongs_to :user

  validates_presence_of :user
end
