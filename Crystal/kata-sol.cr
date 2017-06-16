def scoreThrows(r)
  a = r.reduce(0) do |o, q|
    if q > 10
      o
    elsif q >= 5
      o + 5
    else
      o + 10
    end
  end
  if a == r.size * 10
    return a + 100
  else
    return a
  end
end
