class RemovePerformanceFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :performance, :string
  end
end
