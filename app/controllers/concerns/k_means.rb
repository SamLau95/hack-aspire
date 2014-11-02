class KMeans
  MAX_ITERATIONS = 100

  def initialize(data, num_features, num_centroids)
    @data = data
    # @data = [[1 +, 1, 1, 0, 0, 0, 0, 0]] * 10 + [[0,0,0,0,0,1,1,1]] * 10
    @num_features = num_features
    @num_centroids = num_centroids
    execute
  end

  def execute
    @centroids = gen_random_centroids
    # binding.pry
    MAX_ITERATIONS.times do
      p @centroids
      groups = initialize_groups @centroids

      # Assign each datum to its closest centroid
      @data.each do |datum|
        c = @centroids.min_by { |centroid| dist(datum, centroid)}
        groups[c].push(datum)
      end

      # Find mean of each bucket
      new_centroids = Array.new
      groups.each do |centroid, points|
        new_centroids.push(mean(points))
      end

      @centroids = new_centroids
    end
  end

  def get_labels
    @data.map do |datum|
      @centroids.index(@centroids.min_by { |centroid| dist(datum, centroid)})
    end
  end

  protected

  def initialize_groups(centroids)
    groups = Hash.new
    centroids.each do |centroid|
      groups[centroid] = Array.new
    end
    groups
  end

  def gen_random_centroids
    # Pick n random centroids out of the data
    @data.shuffle.first @num_centroids
    # @num_centroids.times.map { @data[0].length.times.map { rand } }
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
