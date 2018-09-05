# frozen_string_literal: true

class CreateHouseUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :house_users, id: :uuid do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.boolean :is_admin
      t.boolean :active
      t.references :house, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
