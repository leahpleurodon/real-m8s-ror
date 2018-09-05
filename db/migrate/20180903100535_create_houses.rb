# frozen_string_literal: true

class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses, id: :uuid do |t|
      t.string :type
      t.string :profile_pic
      t.string :address
      t.string :state
      t.string :country
      t.string :rent_cycle
      t.datetime :rent_start_date
      t.string :join_code
      t.datetime :code_expiry_date
      t.text :bio

      t.timestamps
    end
  end
end
