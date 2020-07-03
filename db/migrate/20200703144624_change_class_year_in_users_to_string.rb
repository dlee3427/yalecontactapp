class ChangeClassYearInUsersToString < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :class_year, :string
  end
end
