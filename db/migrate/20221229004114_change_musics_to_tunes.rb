class ChangeMusicsToTunes < ActiveRecord::Migration[6.0]
  def change
    rename_table :musics, :tunes
    rename_column :results, :music_id, :tune_id
  end
end
