CoInductive conat : Set := O' | S' (n : conat).

CoFixpoint inf : conat := S' inf.

Fixpoint toCo (n : nat) : conat := match n with
  | O => O'
  | S n' => S' (toCo n') end.

CoInductive bisim : conat -> conat -> Prop :=
  | OO : bisim O' O'
  | SS : forall n m : conat, bisim n m -> bisim (S' n) (S' m).

Notation "x == y" := (bisim x y) (at level 70).

Definition conat_u (n : conat) : conat := match n with
  | O' => O'
  | S' n' => S' n' end.

Lemma conat_unfold : forall n : conat, n = conat_u n.
Proof. destruct n; auto. Qed.

Lemma smaller : forall n : conat,
  ~ (exists m : nat, toCo m == S' n) -> ~ (exists m : nat, toCo m == n).
Proof.
  intros.
  intro.
  destruct H0.
  apply H.
  apply (ex_intro _ (S x)). simpl.
  apply (SS _ _). assumption.
Qed.

Theorem not_fin_then_inf : forall n : conat, ~ (exists m : nat, toCo m == n) -> (n == inf).
Proof.
  cofix qwq.
  intros.
  destruct n.
  exfalso.
  apply H.
  exact (ex_intro _ O OO).
  pose (rec := qwq n (smaller _ H)).
  rewrite (conat_unfold inf). simpl.
  apply SS.
  assumption.
Qed.
