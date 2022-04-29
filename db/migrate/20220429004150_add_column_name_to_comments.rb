class AddColumnNameToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :name, :string, null: false
  end
end
