# frozen_string_literal: true

class AddIndexesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, %i[username email], unique: true
  end
end
