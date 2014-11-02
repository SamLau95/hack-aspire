def seeds
  YAML.load(File.read(File.expand_path('../seeds.yml', __FILE__)))
end

SEEDS = seeds

def create_classrooms
  SEEDS['classrooms'].each do |classroom_attrs|
    Classroom.create! classroom_attrs
  end
end

def create_students
  SEEDS['students'].each do |student_attrs|
    Student.create! student_attrs
  end
end

def create_teachers
  SEEDS['teachers'].each do |teacher_attrs|
    Teacher.create! teacher_attrs
  end
end

def create_tests
  SEEDS['tests'].each do |test_attrs|
    Test.create! test_attrs
  end
end

def create_questions
  SEEDS['questions'].each do |question_attrs|
    Question.create! question_attrs
    end
end

def create_answers
  SEEDS['answers'].each do |answer_attrs|
    Answer.create! answer_attrs
  end
end

create_classrooms
# create_students
create_teachers
create_tests
create_questions
# create_answers
