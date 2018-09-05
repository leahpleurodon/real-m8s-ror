# frozen_string_literal: true

class MateReview < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :author, class_name: 'User'
end
