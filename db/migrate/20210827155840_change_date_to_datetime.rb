class ChangeDateToDatetime < ActiveRecord::Migration[6.0]
  def up
    rename_column :tastings, :date, :start_at
    change_column :tastings, :start_at, :datetime 
  end

  def down
    change_column :tastings, :start_at, :date 
    rename_column :tastings, :start_at, :date
  end
end
