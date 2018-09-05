# frozen_string_literal: true

class CreateMateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :mate_reviews do |t|
      t.decimal :rating
      t.text :comment
      t.boolean :active
      t.uuid :author_id, type: :uuid, foreign_key: true
      t.uuid :user_id, type: :uuid, foreign_key: true
      t.timestamps
    end
  end
end
