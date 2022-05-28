# frozen_string_literal: true

class RemoveIndexFromResult < ActiveRecord::Migration[6.0]
  def change
    remove_index :results, %i[music_id created_at]
  end
end
