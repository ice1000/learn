# this way to construct an array is told by IDE.
# after learned this, I realized Ruby is really a mysterious Programming Language!!
doge_coders = %w(ice1000 jelly 3A myka)
p doge_coders
p doge_coders[0]
p doge_coders[1]
p doge_coders[2]
p doge_coders[3]
p doge_coders[4]

p doge_coders[-1]
p doge_coders[-2]
p doge_coders[-3]
p doge_coders[-4]

p doge_coders[0,4]
p doge_coders[3,1]
p doge_coders[0..2]
p doge_coders[0...2]

students = {
    34 => 'ice1000',
    17 => 'silly_ice1000',
    37 => 'pupil_ice1000'
}

p students[34]
p students[17]
p students[37]

# 在Ruby面前，什么大整数类都是妨碍咱的渣渣！233
num = 0x233
10.times do
  p "Now num is a #{num.class}, valued #{num}"
  num *= num
end

p %q[#{50 * 50}]
p %Q[#{50 * 50}]

test = (0..100)
p test.to_a

test.each do |i|
  print "#{i} "
end

icer = %w{冰封 果冻 3A 蜘蛛 奶茶 妮可 小菜 大C}
icer.each do |s|
  print "#{s}\n"
end

for s in icer do
  p s
end