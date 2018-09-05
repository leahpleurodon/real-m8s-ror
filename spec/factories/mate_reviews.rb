# frozen_string_literal: true

FactoryBot.define do
  factory :mate_review do
    rating { '9.99' }
    comment { "She's my daughter and I want her out of the house so I'm telling you how good she is, but in reality she's pretty shit." }
    active { false }
    user_id { create(:user).id }
    author_id { create(:author).id }
  end
end
