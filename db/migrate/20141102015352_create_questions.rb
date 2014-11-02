class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :test
      t.text :question, :limit => nil
      t.integer :difficulty
      t.text :subject
      t.text :correct_answer
      t.timestamps
    end
  end
end
