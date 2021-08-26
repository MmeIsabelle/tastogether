class AddImageToTastings < ActiveRecord::Migration[6.0]
  def change
    add_column :tastings, :image, :string
  end
end
