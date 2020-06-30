class CreateTransmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :transmissions do |t|
      t.integer :origin_id
      t.integer :spreader_id
      t.integer :infectee_id
      t.datetime :date
      t.boolean :confirmed

      t.timestamps
    end
  end
end
