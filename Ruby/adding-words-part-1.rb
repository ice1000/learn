class Arith
  def initialize(s)
    @mmm = {
      'zero' => 0,
      'one' => 1,
      'two' => 2,
      'three' => 3,
      'four' => 4,
      'five' => 5,
      'six' => 6,
      'seven' => 7,
      'eight' => 8,
      'nine' => 9,
      'ten' => 10
    }
    @i = @mmm[s]
  end
  def add(n)
    aaa = %w(zero one two three
four five six seven eight nine
ten eleven twelve thirteen
fourteen fifteen sixteen seventeen
eighteen nineteen twenty)
    aaa[@i + @mmm[n]]
  end
end
