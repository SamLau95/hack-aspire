class GroupingsToJson
  def initialize(groupings)
    @groupings = groupings
  end

  def execute
    result = []
    @groupings.each do |group|
      id, student_ids = group
      students = Student.find student_ids
      res = { id: id,
              students: get_student_info(students),
              size: student_ids.length,
              avg: get_student_avgs(students) }
      result << res
    end
    binding.pry
    result.to_json
  end

  private

  def get_student_info(students)
    res = []
    students.each do |student|
      res << { id: student.id, score: student.n_correct, name: student.name }
    end
    res
  end

  def get_student_avgs(students)
    students.map(&:percent_right).inject(&:+) / students.length
  end
end
