class CreateBillPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :bill_payments, id: :uuid do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.decimal :amount_due
      t.boolean :paid
      t.datetime :due_date
      t.boolean :active
      t.references :house_bill, type: :uuid, foreign_key: :true
      t.timestamps
    end
  end
end
