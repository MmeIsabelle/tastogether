class DropHostsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :hosts
  end
end
