# Iterative solution
def prime_factors(n)
  factors = []
  (2..n-1).each do |factor|
    while n % factor == 0 do
      factors << factor
      n = n/factor
    end
  end
  return [n] if factors == []
  factors
end
# Recursive solution
def prime_factors(n, factor=2)
  factors = []
  return [n] if factor == n
  if n % factor == 0
    factors << factor
    factors += prime_factors(n/factor,factor)
  else
    factors += prime_factors(n,factor+1)
  end
  factors
end