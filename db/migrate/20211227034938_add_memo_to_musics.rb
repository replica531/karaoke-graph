# frozen_string_literal: true

class AddMemoToMusics < ActiveRecord::Migration[6.0]
  def change
    add_column :musics, :memo, :text
  end
end
