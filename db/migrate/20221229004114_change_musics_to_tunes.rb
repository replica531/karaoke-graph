class ChangeMusicsToTunes < ActiveRecord::Migration[6.0]
  def change
    rename_table :musics, :tunes
  end
end
