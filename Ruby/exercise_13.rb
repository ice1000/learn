class Sqrt2
  def initialize
    @sq2 = 1
    @flo = 0
  end
  def calc(time)
    time.times do 
      @sq2 += 1
      # print @sq2, ' -> '
      if (@sq2) ** 2 >=
      	2 * 10 ** (@flo * 2)
        # print 'big. turn. -> '
			  @sq2 -= 1
				@sq2 *= 10
				@flo += 1
      end
      echo
    end
  end
  def echo
    print Time.now, ":\n", @sq2, "\n"
  end
end

sq = Sqrt2.new
sq.calc 200000
