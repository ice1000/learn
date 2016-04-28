class Algorithms
  def self.add(name)
    if block_given?
      define_method(name) do
        yield
      end
    end
  end

  def self.remove(name)
    remove_method(name)
  end
end

Algorithms.add(:_bubble_sort) do |a, size|
  i = size - 1
  size.times do
    i.times do
      if a[i] > a[i + 1]
        a[i], a[i + 1] = a[i + 1], a[i]
      end
      end
    i -= 1
    end
  a
end

# 想测试，可惜学校里没有irb
# 都有.sort了我又造轮子。。

Algorithms.add(:_calculator) do
  p eval gets
end

# 突发奇想，回家测试
# 扩散的那个，这是二维的
# 然后再试试能不能把方法定义也去掉，直接一个代码块递归
Algorithms.add(:_dfs) do |a, x, y, acce, to|
  a[x][y] = to
  Module::define_method(:dfs) do |_x, _y, s|
    if a[_x][_y] == acce
      return 0
    end
    a[_x][_y] = to
    dfs(_x + 1, _y, s + 1)
    dfs(_x - 1, _y, s + 1)
    dfs(_x, _y + 1, s + 1)
    dfs(_x, _y - 1, s + 1)
  end
  p a.each
  a
end


# 不过这都是回家之后的后话了

# 回家之后：想不到怎么测试啊。。。
