class CreateHouseBills < ActiveRecord::Migration[5.2]
  def change
    create_table :house_bills, id: :uuid do |t|
      t.string :desc
      t.datetime :due_date
      t.decimal :amount
      t.boolean :active
      t.references :user, type: :uuid, foreign_key: true
      t.string :category

      t.timestamps
    end
  end
end
