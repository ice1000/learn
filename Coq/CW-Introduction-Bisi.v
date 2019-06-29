CoInductive stream (A : Set) : Set :=
  | cons : A -> stream A -> stream A.
Arguments cons {_} hd tl.

Notation "x :: y" := (cons x y) (at level 60, right associativity).

Definition head {A} (x : stream A) := match x with
  hd :: _ => hd end.
Definition tail {A} (x : stream A) := match x with
  _ :: tl => tl end.

CoInductive bisim {A : Set} (x y : stream A) : Set :=
  | bisim_eq : head x = head y -> bisim (tail x) (tail y) -> bisim x y.
Notation "x == y" := (bisim x y) (at level 70).

Module Introduction.

  (* Infinite sequence of ones. (not tested) *)
  CoFixpoint ones : stream nat := 1 :: ones.

  (* Infinite sequence of given value. *)
  CoFixpoint repeat {A : Set} (a : A) : stream A := a :: repeat a.

  (* Elements at even and odd indexes, respectively. *)
  CoFixpoint even {A : Set} (x : stream A) : stream A := head x :: even (tail (tail x)).
  Definition odd {A : Set} (x : stream A) : stream A := even (tail x).

  (* A stream equals its head plus its tail. (not tested) *)
  Lemma stream_unfold : forall {A : Set} (a : stream A), head a :: tail a = a.
  Proof. intros A a. destruct a, a0. reflexivity. Qed.

End Introduction.

Module Bisimulation.

  Export Introduction.

  (* Bisimulation is reflexive. *)
  Theorem bisim_refl : forall {A : Set} (a : stream A), a == a.
  Proof.
    cofix qwq.
    intros.
    destruct a.
    exact (bisim_eq (a :: a0) (a :: a0) eq_refl (qwq A a0)).
  Qed.

  (* Odd is tail of Even. *)
  (* Hint: Do you really need cofix? It may depend on your own definition of odd and even. *)
  Theorem odd_even : forall {A : Set} (a : stream A), odd a == even (tail a).  Proof.
    destruct a.
    simpl.
    exact (bisim_refl (even a0)).
  Qed.

End Bisimulation.

Module Merge.

  Export Bisimulation.
  
  (* Interleave two streams, starting with the left one. *)
  CoFixpoint merge {A : Set} (x y : stream A) : stream A := match x with
  | x::xs => x::match y with y::ys => y::merge xs ys end end.

  (* Main task: Merge even and odd, and get the original. *)
  Theorem moe : forall {A : Set} (a : stream A), merge (even a) (odd a) == a.
  Proof.
    cofix qwq.
    intros.
    pose (all := a).
    destruct a.
    apply bisim_eq.
    reflexivity.
    destruct a0.
    apply bisim_eq.
    reflexivity.
    exact (qwq A a1).
  Qed.

End Merge.