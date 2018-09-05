# frozen_string_literal: true

class CreateMateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :mate_profiles, id: :uuid do |t|
      t.string :marital_status
      t.string :job
      t.references :user, type: :uuid, foreign_key: true
      t.boolean :is_smoker
      t.string :faith
      t.string :personality

      t.timestamps
    end
  end
end
