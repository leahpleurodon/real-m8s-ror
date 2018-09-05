class AddPaidToHouseBills < ActiveRecord::Migration[5.2]
  def change
    add_column :house_bills, :paid, :boolean
  end
end
