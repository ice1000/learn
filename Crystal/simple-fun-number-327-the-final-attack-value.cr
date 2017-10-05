def gcd(a, b)
  b == 0 ? a : gcd b, a % b
end

def final_attack_value(x, ml)
  ml.each do |n|
    x += x > n ? n : gcd x, n
  end
  x
end

