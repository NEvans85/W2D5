require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets
    unless include?(key)
      self[key.hash] << key
      @count += 1
    end
  end

  def remove(key)
    self[key.hash].delete(key)
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    arr = Array.new(num_buckets * 2) { Array.new }
    @store.flatten.each do |el|
      arr[el % arr.length] << el
    end
    @store = arr
  end
end
