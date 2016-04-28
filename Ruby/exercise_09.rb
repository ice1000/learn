# 实现Java风格的new方法
# 我感觉我好会玩啊。。

require './coder'

def new(name)
  name.new
end


class Example
  def test
    p 'tested!'
  end
end

ice = new Example
ice.test

ice2 = new Coder
