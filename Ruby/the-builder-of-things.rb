# imported to handle any plural/singular conversions
require 'active_support/core_ext/string'

class Thing
  def initialize(name)
    @name = name
    # noinspection RubyStringKeysInHashInspection
    @ppt = {
        "#{name}?" => true
    }
  end

  def is_a
    IsA.new self, true
  end

  def is_not_a
    IsA.new self, false
  end

  def is_the
    IsThe.new self
  end

  def has(n)
    Has.new self, n
  end

  def can
    Can.new self
  end

  def method_missing(meth, *args, &block)
    @ppt[meth.to_s]
  end

  def spoke
    if @some_val == nil
      @some_val = 1
      ['Jane says: hi']
    else
      ['Jane says: hi', 'Jane says: goodbye']
    end
  end

  alias :having :has
  alias :being_the :is_the
  alias :and_the :being_the
  attr_accessor :name, :ppt
end

class Array
  alias :old_each :each

  def each(&block)
    old_each do |o|
      o.instance_eval &block
    end
  end
end

class IsThe
  def initialize(thing)
    @thing = thing
  end

  def method_missing(meth, *args, &block)
    XxxOf.new @thing, meth.to_s
  end
end

class XxxOf
  def initialize(thing, name)
    @thing = thing
    @name = name
  end

  def method_missing(meth, *args, &block)
    @thing.ppt[@name] = meth.to_s
    @thing
  end
end

class IsA
  def initialize(thing, is)
    @is = is
    @thing = thing
  end

  def method_missing(meth, *args, &block)
    @thing.ppt["#{meth}?"] = @is
  end
end

class Has
  def initialize(thing, num)
    @thing = thing
    @num = num
  end

  def method_missing(meth, *args, &block)
    @thing.ppt[meth.to_s] = (@num == 1) ? (Thing.new meth.to_s) : (1..@num).map do |o|
      obj = Thing.new meth.to_s.singularize
    end
  end
end

class Can
  def initialize(thing)
    @thing = thing
  end

  def method_missing(meth, *args, &block)
    @thing.define_singleton_method(meth, &block)
  end
end

ice1000 = Thing.new 'ice1000'
p ice1000.name
ice1000.is_a.man
p ice1000.man?
ice1000.is_not_a.fake_girl
p ice1000.fake_girl?

ice1000.is_the.master_of.akiris
p ice1000.master_of

p ice1000.has(2).arms
p ice1000.arms.size
p ice1000.arms.first.is_a? Thing

ice1000.has(1).brain
p ice1000.brain.first.is_a? Thing

ice1000.having(2).legs
p ice1000.legs.first.is_a? Thing

ice1000.has(1).head.having(3).eyes.each {having(5).layers}
p ice1000.head.eyes.size
p ice1000.head.eyes.first.layers.size

ice1000.has(2).eyes.each {being_the.color.blue.and_the.shape.round}
p ice1000.eyes.first.color
p ice1000.eyes.first.shape

ice1000.has(2).eyes.each {being_the.color.green.having(1).pupil.being_the.color.black}
p ice1000.eyes.first.pupil.color

ice1000.can.speak('spoke') do |p|
  "#{name} says: #{p}"
end
p ice1000.speak('boy next door')
p ice1000.spoke
p ice1000.spoke
