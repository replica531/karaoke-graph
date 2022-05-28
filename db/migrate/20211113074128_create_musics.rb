# frozen_string_literal: true

class CreateMusics < ActiveRecord::Migration[6.0]
  def change
    create_table :musics do |t|
      t.string :title
      t.string :artist
      t.integer :user_id

      t.timestamps
    end
  end
end
