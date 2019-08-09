Module hott2019.

Require Import Basics Types Coeq UnivalenceAxiom.

Definition Quot (A : Type) (R : A -> A -> Type) : Type :=
  @Coeq {b : A * A & R (fst b) (snd b)}
        A (fun x => fst (x .1)) (fun x => snd (x .1)).

Definition inj {A : Type} {R : A -> A -> Type} (a : A) : Quot A R := coeq a.

Notation "[ a ]" := (inj a).

Definition glue {A : Type} {R : A -> A -> Type} {a b : A} (s : R a b) :
  @inj A R a = @inj A R b := cp ((a,b);s).

Definition Quot_ind {A : Type} {R : A -> A -> Type} (P : Quot A R -> Type)
           (f : forall (a : A), P [a])
           (g : forall a b (s : R a b), (glue s) # (f a) = (f b)) : forall x, P x :=
  fun x => Coeq_ind _ _ (fun b => g (fst b .1) (snd b .1) b .2) _.

Definition Quot_ind_beta
           (A : Type)
           (R : A -> A -> Type)
           (P : Quot A R -> Type)
           (f : forall (a : A), P [a])
           (g : forall a b (s : R a b), (glue s) # (f a) = (f b)) :
  forall a b (s : R a b), apD (Quot_ind P f g) (glue s) = g a b s :=
  fun a b s => Coeq_ind_beta_cp _ _ _ ((a, b); s).
