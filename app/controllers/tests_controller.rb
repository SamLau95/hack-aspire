class TestsController < ApplicationController
  def show
  	@test = Test.first
  	@questions = @test.questions
  end
end
