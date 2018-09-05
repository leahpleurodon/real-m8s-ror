class CreateBillImages < ActiveRecord::Migration[5.2]
  def change
    create_table :bill_images, id: :uuid do |t|
      t.string :image
      t.boolean :active
      t.references :house_bill, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
