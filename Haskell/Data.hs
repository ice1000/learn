module Data where

data Contact = Mobile String
             | Email String
             | Name String

valid :: Contact -> Bool
valid (Mobile tel) = (length tel) == 11
valid (Email mail) = elem '@' mail
valid (Name name) =
  let
    nameLength = length name
  in
    nameLength >= 5 && nameLength <= 12

-- valid (Mobile "11111111111") -- true
