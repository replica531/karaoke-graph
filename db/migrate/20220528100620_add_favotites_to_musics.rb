# frozen_string_literal: true

class AddFavotitesToMusics < ActiveRecord::Migration[6.0]
  def change
    add_column :musics, :favorite, :boolean, default: false, null: false
  end
end
