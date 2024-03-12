class ChangeUserColumns < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :name, :string, null: false
    change_column :users, :phone, :string, null: false
  end
end
