class RemoveUserFromTastings < ActiveRecord::Migration[6.0]
  def change
    remove_reference :tastings, :user, null: false, foreign_key: true
  end
end
