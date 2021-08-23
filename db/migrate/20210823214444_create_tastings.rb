class CreateTastings < ActiveRecord::Migration[6.0]
  def change
    create_table :tastings do |t|
      t.string :title
      t.string :description
      t.string :location
      t.date :date
      t.integer :capacity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
