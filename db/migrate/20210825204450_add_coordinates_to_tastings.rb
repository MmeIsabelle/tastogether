class AddCoordinatesToTastings < ActiveRecord::Migration[6.0]
  def change
    add_column :tastings, :latitude, :float
    add_column :tastings, :longitude, :float
  end
end
