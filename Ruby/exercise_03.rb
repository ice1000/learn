
class Ice1000
  def _go
    p 'fuck '
  end
  def initialize
    # some code
  end
  def _code
    # some code
    p 233
  end
  # set an alias
  alias :_went:_go
end

ice1000 = Ice1000.new
ice1000._go

if defined? _code
  p 233
else
  p 666
end

class Ice1000
  def _go
    p 'shit '
  end
end

ice1000._go
ice1000._went
