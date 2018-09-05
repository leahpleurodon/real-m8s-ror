# frozen_string_literal: true

FactoryBot.define do
  factory :mate_profile do
    association :user, factory: :user
    marital_status { 'single' }
    job { 'Technical Consultant' }
    is_smoker { false }
    faith { 'jedi' }
    personality { 'quiet, non party animal' }
  end
end
