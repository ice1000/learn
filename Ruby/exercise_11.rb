class Count2File
  MAX_CNT = 2
  def initialize(&block)
    @cnt = 0
    @block = block
  end
  def increase
    @cnt += 1
    @cnt %= MAX_CNT
    if @cnt == 0
      @block.call
    end
  end
end

module UtilMethods
  SIZE = 10000.0
  def included(base)
    base.class_eval do
      # define open_as_file
    end
    super
  end
  def open_as_file(*names)
    names.each do |name|
      eval "@f#{name} = File.open(File.join('.', '#{name}'),'a')"
    end
  end
  def _getr
    rand SIZE + 1
  end
end

class PiCalc
  include UtilMethods
  def initialize
    open_as_file :square, :round, :pi
    @x_loc, @y_loc = _getr, _getr
    @round_cnt  = Count2File.new
    @square_cnt = Count2File.new
    print "蒙特卡洛法计算圆周率\n"
  end
  def _calc
    @x_loc , @y_loc = _getr , @x_loc
    to_center = ((@x_loc - SIZE / 2) ** 2 +
        (@y_loc - SIZE / 2) ** 2) ** (1.0 / 2)
    # print to_center, "\n"
    if to_center < SIZE / 2
      @round_cnt.increase
    else
      @square_cnt.increase
    end
  end
  def _run(time)
    time.times do
      _calc
    end
    print '计算了', time, "次\n"
  end
  def _res
    round = File.size(@fround)
    square = File.size(@fsquare) + round
    print 'current time is:', Time.now , "\n"
    print 'inside round:', round, "\n"
    print 'total number:', square, "\n"
    # U can add more zeros 2 make it more exact.
    res = (4.0 * round) / square
    @fpi.puts(res)
    print 'calculate result:', res, "\n"
  end
end

# 在此处进行计算
pi = PiCalc.new
10000.times do
  pi._run 1000
  pi._res
end
pi._res
