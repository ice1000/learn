# WritingCodes = 'writing codes'
class Coder
  def initialize(name)
    @name = name
  end
  def _code
    @state = 'WritingCodes'
  end
  def _def_methods(name_)
    define_method(name_) do |name|
      p name
      name
    end
  end
end


