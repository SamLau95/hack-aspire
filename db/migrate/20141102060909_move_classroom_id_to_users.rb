class MoveClassroomIdToUsers < ActiveRecord::Migration
  def change
    remove_column :students, :classroom_id
    add_column :users, :classroom_id, :integer
    add_index :users, :classroom_id
  end
end
