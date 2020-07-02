class RemoveContagiousFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :contagious
  end
end
