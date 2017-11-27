theory Scratch1
  imports Main
begin
  fun conj :: "bool \<Rightarrow> bool \<Rightarrow> bool" where
    "conj True True = True" |
    "conj _ _  = False"
end

