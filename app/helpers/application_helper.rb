module ApplicationHelper
  def class_if?(klass, exp)
    exp ? klass : nil
  end

  def hidden_if?(exp)
    class_if? "hide", exp
  end
end
