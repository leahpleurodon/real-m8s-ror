class AddActiveToUserHouseChores < ActiveRecord::Migration[5.2]
  def change
    add_column :user_house_chores, :active, :boolean
  end
end
