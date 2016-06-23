Ice = {
  name = "千里冰封",
  age = 16,
  sex = 3,
  job = "Android Developer"
}

function Ice: new(o, name, age, sex, job)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.age = age or 0
  self.name = name or ""
  self.sex = sex
  self.job = job
  return o
end

function Ice: grow()
  self.age = self.age + 1
  return self.age
end

function Ice: rename(name)
  self.name = name or 0
  return self.name
end
 
me = Ice:new(nil, "ice1000", 16, 3, "Android Developer")

print(me.name)

print(me:grow())
me:grow()
print(me.age)

print(me.job)