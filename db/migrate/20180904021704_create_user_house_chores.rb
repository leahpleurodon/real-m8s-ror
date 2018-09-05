class CreateUserHouseChores < ActiveRecord::Migration[5.2]
  def change
    create_table :user_house_chores, id: :uuid do |t|
      t.references :house, type: :uuid, foreign_key: true
      t.references :user, type: :uuid, foreign_key: true
      t.references :chore, type: :uuid, foreign_key: true
      t.string :day_of_week
      t.string :frequency

      t.timestamps
    end
  end
end
