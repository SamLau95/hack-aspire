class TestsController < ApplicationController
  before_filter :verify_not_taken

  def show
    @test = Test.first
    @questions = @test.questions
  end

  def submit
    answers = params[:answers]
    answers.each do |question_id, answer|
      q = Question.find(question_id)
      a = Answer.create! question_id: question_id,
                         student: current_user,
                         answer: answer
    end
    redirect_to done_page_path
  end

  private

  def verify_not_taken
    redirect_to done_page_path, error: "You've already taken the test!" if current_user.taken_test?
  end
end
