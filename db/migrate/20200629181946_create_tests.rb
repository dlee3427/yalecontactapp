class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.integer :user_id
      t.datetime :date
      t.boolean :result
      t.integer :facility_id

      t.timestamps
    end
  end
end
