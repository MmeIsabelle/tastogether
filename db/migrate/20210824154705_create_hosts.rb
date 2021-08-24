class CreateHosts < ActiveRecord::Migration[6.0]
  def change
    create_table :hosts do |t|

      t.timestamps
    end
  end
end
