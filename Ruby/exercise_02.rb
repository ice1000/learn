#encoding utf-8

class Ice1000
  # this is considered to be bad code style.
  # just like static variable in Java、C.233
  @@aaa = 233
  public
  def initialize
    # some code to initialize this obj
  end
  def _smile
    print "ice1000 is smiling\n"
  end
  def Ice1000._ass_we_can
    print "啊♂我要搞死你♂哈\n"
  end
end

class Ice1000
  def _test_1(aaa)
    @aaa = aaa
  end
  def _print_aaa
    print @aaa;
  end
  def _get_aaa
    @@aaa
  end
end

ice1000 = Ice1000.new
ice1000._smile

class << ice1000
  def _wu
    print "ice1000 is driving!\n"
  end
end

class Ice1000
  undef_method(:_smile)
end

PI = 3.14159265358979323846263383279502884197

ice1000._test_1(233)
ice1000._print_aaa
# this will throw a runtime error.
# I miss Java`s Exception.
# ice1000._smile
print ice1000._get_aaa
