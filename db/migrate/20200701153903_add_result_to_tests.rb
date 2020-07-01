class AddResultToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :result, :string
  end
end
