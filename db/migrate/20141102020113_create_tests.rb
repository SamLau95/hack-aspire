class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.references :classroom
      t.string :name
      t.timestamps
    end
  end
end
