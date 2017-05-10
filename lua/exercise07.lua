function curry(a)
  return function(b)
    return function(c)
      return a + b + c
    end
  end
end

function curry2(a)
  return function(b)
    return function(c)
      return function(d)
        return a + b + c + d
      end
    end
  end
end

print("curry(2)(3)(4) is ", curry(2)(3)(4))

print("curry2(2)(3)(4)(5) is ", curry2(2)(3)(4)(5))