# frozen_string_literal: true

class RenamePointColumnToResults < ActiveRecord::Migration[6.0]
  def change
    rename_column :results, :point, :score
  end
end
