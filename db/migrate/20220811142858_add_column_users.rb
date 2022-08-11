class AddColumnUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :default_model, :string, default: 'その他', null: false
  end
end
