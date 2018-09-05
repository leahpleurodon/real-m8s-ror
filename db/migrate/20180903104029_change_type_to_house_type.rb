# frozen_string_literal: true

class ChangeTypeToHouseType < ActiveRecord::Migration[5.2]
  def change
    rename_column :houses, :type, :house_type
  end
end
