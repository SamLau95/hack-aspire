class PagesController < ApplicationController
  def home
  end

  def done
    @performance = current_user.performance
  end
end
