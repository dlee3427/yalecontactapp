class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :class_year
      t.integer :res_college_id
      t.string :user_type
      t.boolean :contagious

      t.timestamps
    end
  end
end
