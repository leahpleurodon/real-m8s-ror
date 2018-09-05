# frozen_string_literal: true

class AddRentToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :rent, :decimal
  end
end
