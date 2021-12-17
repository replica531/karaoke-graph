class AddColumnToResult < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :model, :string, null: false, default: "その他"
  end
end
