# require  './coder.rb'
class Coder
  def initialize(name)
    @name = name
  end
  def _code
    @state = 'WritingCodes'
  end
  def self._def_methods(name_)
    define_method(name_) do |name|
      p name ;name
    end
  end
end

ice1000 = Coder.new('ice1000')
ice1000._code
Coder._def_methods(:method_1)
ice1000.send(:method_1)
p ice1000.methods
