class CreateChores < ActiveRecord::Migration[5.2]
  def change
    create_table :chores, id: :uuid do |t|
      t.string :name
      t.boolean :outdoor
      t.boolean :active

      t.timestamps
    end
  end
end
