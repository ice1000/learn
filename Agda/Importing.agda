module Importing where

  module a where
    data gadt : Set where
      construct : gadt

  module b where
    open a using (gadt) public
    f : gadt → gadt
    f gadt.construct = gadt.construct
