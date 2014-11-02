class AddAnswerChoiceToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answer_choice, :text, array: true, :limit => nil
  end
end
