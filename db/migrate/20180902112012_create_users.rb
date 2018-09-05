# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :username
      t.datetime :dob
      t.string :profile_pic
      t.boolean :active
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
