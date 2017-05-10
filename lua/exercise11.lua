print(os.date())

Person = {
  birth = os.date(),
  name = "",
  age = 1,
  gender = 1
}

function Person: new(o, name, age, gender)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.birth = os.date()
  self.name = name or ""
  self.age = age or 1
  self.gender = gender or 0
end

ice = Person:new(nil, "ice1000", 16, 3)