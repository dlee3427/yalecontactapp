class RemovePositiveResultFromTests < ActiveRecord::Migration[6.0]
  def change
    remove_column :tests, :positive_result
  end
end
