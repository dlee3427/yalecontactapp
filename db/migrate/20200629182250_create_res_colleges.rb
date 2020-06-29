class CreateResColleges < ActiveRecord::Migration[6.0]
  def change
    create_table :res_colleges do |t|
      t.string :name

      t.timestamps
    end
  end
end
