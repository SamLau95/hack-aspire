class TeachersController < ApplicationController
  before_filter :ensure_teacher_logged_in

  def analytics
    data = DataExtractor.new(Student.taken_test).execute
    groupings = KMeans.new(data).get_labels
    gon.push group_data: GroupingsToJson.new(groupings).execute
  end

  def students
  	@students = Student.all
  end
end
