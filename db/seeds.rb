def seeds
  YAML.load(File.read(File.expand_path('../seeds.yml', __FILE__)))
end

SEEDS = seeds

def create_classrooms
  SEEDS['classrooms'].each do |classroom|
    Classroom.create! name: classroom['name']
  end
end

def create_students
  SEEDS['students'].each do |student_attributes|
    Student.create! student_attributes
  end
end

def create_teachers
  SEEDS['teachers'].each do |teacher_attributes|
    Teacher.create! teacher_attributes
  end
end

def create_tests
  SEEDS['tests'].each do |test|
    Test.create! classroom_id: test['classroom_id'],
                 name: test['name']
  end
end

def create_questions
  SEEDS['questions'].each do |question|
    Question.create!    test_id: question['test_id'],
                        question: question['question'],
                        difficulty: question['difficulty'],
                        subject: question['subject'],
                        answer_choice: question['answer_choice'],
                        correct_answer: question['correct_answer']
    end
end

def create_answers
  SEEDS['answers'].each do |avail|
    Answer.create! question_id: avail['question_id'],
                   answer: avail['answer']
  end
end

create_classrooms
create_students
create_teachers
create_tests
create_questions
create_answers
