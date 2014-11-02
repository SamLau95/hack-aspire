class AddAnswerChoiceToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answer_choice, :string, array: true
  end
end
