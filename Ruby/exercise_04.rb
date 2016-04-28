class Vedio
  def _1
    p 'this is _1'
  end
  def _2
    p 'this is _2'
  end
  def _3
    p 'this is _3'
  end
  def initialize
  end
end

class AdultVedio < Vedio
  def _1
    p 'this is extended _1'
  end
  def initialize
  end
  undef _2
end

vedio = Vedio.new
vedio._1
vedio._2
vedio._3
adult_vedio = AdultVedio.new
adult_vedio._1
# this code will throw an exception
# that method _2 is not defined.

adult_vedio._2
adult_vedio._3
