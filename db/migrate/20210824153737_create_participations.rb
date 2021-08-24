class CreateParticipations < ActiveRecord::Migration[6.0]
  def change
    create_table :participations do |t|
      t.string :status
      t.boolean :host
      t.text :initial_message
      t.references :tasting, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
