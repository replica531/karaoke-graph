class RemoveIndexFromResult < ActiveRecord::Migration[6.0]
  def change
    remove_index :results, [:music_id, :created_at]
  end
end
