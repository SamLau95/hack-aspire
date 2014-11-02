class KMeans
  MAX_ITERATIONS = 100

  def initialize(data, num_features, num_centroids)
    @data = data
    @num_features = num_features
    @num_centroids = num_centroids
  end

  def execute
    centroids = gen_random_centroids
    MAX_ITERATIONS.times do
      buckets = Hash.new
      centroids.each do |centroid|
        buckets[centroid] = Array.new
      end

      data.each do |datum|
        # Find the closest centroid
        centroids.each do |centroid|
          dist(datum, centroid)
        end

      end

    end

    # While less than max iterations or no change
  end

  def gen_random_centroids
    # Pick n random centroids out of the data
    @data.shuffle [0, @num_centroids]
  end

  def dist(x,y)
    # Returns euclidean distance of two vectors
    dist = 0
    x.zip(y).each do |i,j|
      dist += (i - j) ** 2
    end
    dist ** 1/2
  end

end
