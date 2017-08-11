class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return "empty array".hash if empty?
    iDed = map.with_index { |el, i| (el.hash * (i + 1)) }
    iDed.reduce(:+)
  end
end

class String
  def hash
    chars.map.with_index { |ch, idx| (ch.ord * (idx + 1)).hash }.reduce(:+)
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.sort.hash 
  end
end
