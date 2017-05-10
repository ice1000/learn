# 再试试能不能玩meta
# 一个C语言风格的数组
# 不过由于缺少资料，忘记了字符串和符号类型的转换了。。。
# 希望我写的是对的。。

class MyArray
  def initialize
#  def initialize(size)
#    @size = size
#    size.times do |i|
#      @("a#{i}".to_s) = 0
#    end
  end
  
  def [](idx)
    result = 0
    if idx > Size
      Size = idx
    else
      result = "@a#{idx}".to_sym
    end
    result
  end
  
  def []=(idx, val)
    if idx > Size
      Size = idx
      "@a#{idx}".to_sym = val
    else
      "@a#{idx}".to_sym = val
    end
  end
  
  def length
    size
  end
end


ice = MyArray.new

ice[3] = 233
ice[5] = 666
p ice[3]

p ice.length






























