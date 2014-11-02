class AddPerformanceToUser < ActiveRecord::Migration
  def change
    add_column :users, :performance, :string
  end
end
