class KMeans
  MAX_ITERATIONS = 100

  def initialize(data, num_features=Question.count, num_centroids=4)
    # @data = data
    @data ||= { 1 => [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1],
              2 => [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
              3 => [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0],
              4 => [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0],
              5 => [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0],
              6 => [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0],
              7 => [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0],
              8 => [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
              9 => [1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
              10 => [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] }
    @num_features = num_features
    @num_centroids = num_centroids
    execute
  end

  def execute
    # binding.pry
    @centroids = gen_random_centroids
    MAX_ITERATIONS.times do
      # Assign each datum to its closest centroid
      group_data_by_centroids

      # Find mean of each bucket
      new_centroids = {}
      @centroids.each do |centroid, points|
        new_centroid = mean(points)
        new_centroids[new_centroid] = []
      end

      @centroids = new_centroids
    end
    group_data_by_centroids
  end

  def get_labels
    # binding.pry
    @centroids.values.map.with_index do |points, i|
      [i, points.map { |point| @data.key(point) }]
    end
  end

  protected

  # Picks @num_centroids random centroids out of the data
  def gen_random_centroids
    centroids = {}
    @data.values.shuffle.first(@num_centroids).each do |centroid|
      centroids[centroid] = []
    end
    centroids
  end

  def group_data_by_centroids
    @data.each do |s_id, datum|
      c = @centroids.keys.min_by { |centroid| dist(datum, centroid)}
      @centroids[c].push(datum)
    end
  end

  def mean(points)
    points.transpose.map(&:sum).map { |n| n.to_f / points.length }
  end

  def dist(x,y)
    # Returns euclidean distance of two vectors
    dist = 0.0
    x.zip(y).each do |i,j|
      dist += (i - j) ** 2
    end
    dist ** (1.0/2)
  end

end
