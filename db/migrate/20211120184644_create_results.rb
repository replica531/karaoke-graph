# frozen_string_literal: true

class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.float :point
      t.text :memo
      t.datetime :datetime
      t.references :music, null: false, foreign_key: true

      t.timestamps
    end
    add_index :results, %i[music_id created_at]
  end
end
