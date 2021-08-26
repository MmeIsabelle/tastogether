class ChangeTimeToDateTime < ActiveRecord::Migration[6.0]
  def change
    change_column(:tastings, :date, :datetime)
  end
end
