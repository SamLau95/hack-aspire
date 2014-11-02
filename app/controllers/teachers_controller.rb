class TeachersController < ApplicationController
  def analytics

    # N-dimensional array of student answer vectors
    data = [[1, 0, 1, 0, 1, 1, 1], [1, 0, 0, 0, 1, 1, 1], [1, 0, 1, 0, 1, 1, 1], [1, 0, 1, 0, 1, 1, 1]]

    @clustering = KMeans.new(data, data[0].length, 2).execute


  end
end
