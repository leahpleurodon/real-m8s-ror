class UserHouseChore < ApplicationRecord
  belongs_to :house
  belongs_to :user
  belongs_to :chore
end
