print(os.date())

Person = {
  birth = os.date()
  name = ""
  age = 1
  gender = 1
}

function Person: new(o, name, age, gender)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.birth = os.date()
  
end