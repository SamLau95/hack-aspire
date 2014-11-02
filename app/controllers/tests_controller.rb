class TestsController < ApplicationController
  before_filter :ensure_student_logged_in
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
    if current_user.taken_test?
      flash[:error] = "You've already taken the test!"
      redirect_to done_page_path
    end
  end
end
