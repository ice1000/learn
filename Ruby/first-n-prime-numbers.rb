# TODO implement a Primes class with a class method first(n)
#   that returns an array of the first n prime numbers.
def primeSieve(n)
  ret = (0..n - 2).map do |i|
    i + 2
  end
  i = 0
  while ret[i]**2 <= ret.last
    p = ret[i]
    ret = ret.select {|x| x == p || x%p != 0}
    i += 1
  end
  ret
end

class Primes
  @@primes = primeSieve 811955
  def self.first(n)
    @@primes.take n
  end
end

# p Primes.first(611953).last(1)
