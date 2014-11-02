class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :test
      t.string :question
      t.integer :difficulty
      t.string :subject
      t.string :correct_answer
      t.timestamps
    end
  end
end
