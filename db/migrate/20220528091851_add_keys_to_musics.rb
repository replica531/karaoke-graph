class AddKeysToMusics < ActiveRecord::Migration[6.0]
  def change
    add_column :musics, :key, :integer, null: false, default: 0
    add_column :results, :key, :integer, null: false, default: 0
  end
end
