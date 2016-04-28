# encoding utf-8
# Ruby真是门魔幻的语言
#                     ——冰封

class Person
  def initialize(int)
    @int = int
  end
  def _print_state
    print "The information about this person is:\n"
  end
end

class Coder_ < Person
  attr_accessor :test1, :test2, :name, :age, :sex, :cloth
  def initialize(name, age, sex, test1)
    @name = name
    @age = age
    @sex = sex
    @test1 = test1
  end
  def _print_state
    super
    puts "#{name}\n#{age}\n#{sex}\n"
  end
  def _wear_cloth(cloth_name)
    @cloth = cloth_name
  end
  def _show_cloth
    print "#{name}正穿着#{cloth}呢！\n"
  end
  def <=> (other)
    self.name <=> other.name
  end
end

puts('Hello world')
jelly = Coder_.new('千本果冻樱', 18, 'futa', 666)
def jelly._read_ero_book
  print "Jelly is reading 工口 books!\n"
end
jelly._print_state
jelly._read_ero_book
predator_sd = Coder_.new('小源', 13, 'gay', 233)
predator_sd._print_state
tardis = Coder_.new('奶茶未凉心已死', 18, 'female', 07)
tardis._print_state
aaa = Coder_.new('周明凯', -1, 'male', 233)
def aaa._fish
  fish = Person.new(233)
  fish._print_state
  print "3A钓鱼成功！\n"
end
aaa._fish
aaa._print_state
cecilia = Coder_.new('大C', 18, 'null', 0)
cecilia._print_state
罗旭恒 = Coder_.new('罗旭恒', 15, 'male', 233)
def 罗旭恒._来大姨妈
  print "罗旭恒来大姨妈了！\n"
end
罗旭恒._来大姨妈
罗旭恒._print_state

冰封 = Coder_.new('千里冰封', 16, 'fake_female', 233)
def 冰封._write_java
  print "冰封 is writing Java codes!\n"
  print "冰封 is doing Android developing!\n"
end
# def 冰封.穿女仆装
# end
冰封._wear_cloth(女仆装)
冰封._show_cloth
冰封._print_state
冰封._write_java
