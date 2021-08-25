class AddMoreColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :avatar, :string
    add_column :users, :address, :string
  end
end
