class DataExtractor
  def initialize(klass)
    @klass = klass
  end

  def execute
    vec = {}
    @klass.all.each { |obj| vec[obj.id] = to_vec obj.answers}
    vec
  end

  def to_vec(answers)
    answers.map do |answer|
      if answer.correct?
        1
      else
        0
      end
    end
  end
end
