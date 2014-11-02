class TeachersController < ApplicationController
  def analytics
    data = DataExtractor.new(Student.taken_test).execute
    @clustering = KMeans.new(data, data[0].length, 2).get_labels
  end

  def students
  	@students = Student.all
  end
end
