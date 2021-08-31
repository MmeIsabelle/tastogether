class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.text :text
      t.boolean :viewed, default: false, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
