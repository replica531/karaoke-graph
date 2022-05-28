# frozen_string_literal: true

class AddIndexToMusic < ActiveRecord::Migration[6.0]
  def change
    add_index :musics, :user_id
  end
end
