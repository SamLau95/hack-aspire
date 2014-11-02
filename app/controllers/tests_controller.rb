class TestsController < ApplicationController
  def show
  	@test = Test.first
  	@questions = @test.questions
  end

  # takes the form data and processes it; stores array of 0's and 1's
  def submit
  	answers = params[:answers]
  	answers.each do |key, val|
  	  q = Question.find(key.to_i)
  	  a = Answer.create! question_id: key.to_i,
  	  		             student_id: current_user.id, 
  	  		             answer: val
  	end
    redirect_to done_path
  end
end
