{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE RankNTypes            #-}
{-# LANGUAGE ScopedTypeVariables   #-}

module SKIGen where

newtype Scope repr = Scope { abstract :: repr }

getVar :: repr -> Scope repr
getVar iR = Scope iR

liftConst
  :: repr
  -> (repr -> repr -> repr)
  -> repr
  -> Scope repr
liftConst kR appR = Scope . appR kR

liftApp
  :: repr
  -> (repr -> repr -> repr)
  -> Scope repr
  -> Scope repr
  -> Scope repr
liftApp sR appR (Scope f) (Scope x) = Scope $ (sR `appR` f) `appR` x

class HasSKI repr where
  s, k, i :: repr
  (@-) :: repr -> repr -> repr -- 函数应用

infixl 9 @-

instance HasSKI SKI where
  s = S
  k = K
  i = I
  (@-) = App

instance (HasSKI repr) => HasSKI (Scope repr) where
  s = liftConst k (@-) s
  k = liftConst k (@-) k
  i = liftConst k (@-) i
  (@-) = liftApp s (@-)

var :: (HasSKI repr) => Scope repr
var = getVar i

suc :: (HasSKI repr) => repr -> Scope repr
suc = liftConst k (@-)

data SKI
  = App SKI SKI | S | K | I

instance Show SKI where
  show S         = "S"
  show K         = "K"
  show I         = "I"
  show (App u v) = "(" ++ show u ++ " $$ " ++ show v ++ ")"

class LiftVar u v where
  liftVar :: u -> v

instance {-# OVERLAPPABLE #-}
    (HasSKI v, LiftVar u v) => LiftVar u (Scope v) where
  liftVar = suc . liftVar

instance {-# OVERLAPS #-} LiftVar a a where liftVar = id

-- 这个 instance 纯粹是为了让 GHC 高兴
instance LiftVar (Scope repr) (Scope repr) where liftVar = id

lam :: forall repr. HasSKI repr
    => ((forall k. LiftVar (Scope repr) k => k) -> Scope repr) -> repr
lam f = abstract (f $ liftVar (var :: Scope repr))
