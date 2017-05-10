require 'builder'

builder = Builder::XmlMarkup.new

coder = builder.coder do
  b.name 'ice1000'
  b.thought = 'meta'
  b.sex = 'futa'
  b.age = 16
  b.qq = 951394653
  b.organization = 'PLASTIC'
end

file = File.open('12_out', 'w+')
file.puts coder
print coder

# used 2 generat an XML file.
