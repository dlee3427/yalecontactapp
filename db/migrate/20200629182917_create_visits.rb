class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.integer :location_id
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :contagious

      t.timestamps
    end
  end
end
