class AddHouseToHouseBills < ActiveRecord::Migration[5.2]
  def change
    add_reference :house_bills, :house, type: :uuid, foreign_key: true
  end
end
