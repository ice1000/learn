(** Can you write down three "different" proofs of transitivity (they should all be judgmentally different; [refl] should not prove any two of them the same. *)

Definition trans1
: forall A (x y z : A),
    x = y -> y = z -> x = z.
Proof.
  intros.
  destruct H.
  exact H0.
Defined.
Definition trans2
: forall A (x y z : A),
    x = y -> y = z -> x = z.
Proof.
  intros.
  destruct H0.
  exact H.
Defined.
Definition trans3
: forall A (x y z : A),
    x = y -> y = z -> x = z.
Proof.
  intros.
  destruct H, H0.
  reflexivity.
Defined.

(** Now we have Coq check that they are not the same; these lines should compile unmodified. *)

Fail Check eq_refl : trans1 = trans2.

Fail Check eq_refl : trans2 = trans3.

Fail Check eq_refl : trans1 = trans3.

(** Now prove that these are all equal (propositionally, but not judgmentally. *)

Definition trans_12
: forall A (x y z : A) (H0 : x = y) (H1 : y = z),
    trans1 A x y z H0 H1 = trans2 A x y z H0 H1.
Proof.
  intros.
  destruct H0, H1.
  reflexivity.
Qed.
Definition trans_23
: forall A (x y z : A) (H0 : x = y) (H1 : y = z),
    trans2 A x y z H0 H1 = trans3 A x y z H0 H1.
Proof.
  intros.
  destruct H0, H1.
  reflexivity.
Qed.

(** We can also prove associativity. *)

Definition trans_assoc
: forall A (x y z w : A) (H0 : x = y) (H1 : y = z) (H2 : z = w),
    eq_trans H0 (eq_trans H1 H2) = eq_trans (eq_trans H0 H1) H2.
Proof.
  intros.
  destruct H0, H1, H2.
  reflexivity.
Qed.

Definition trans_Vp
: forall A (x y : A) (H : x = y),
    eq_trans (eq_sym H) H = eq_refl.
Proof.
  intros.
  destruct H.
  reflexivity.
Qed.

Definition trans_pV
: forall A (x y : A) (H : x = y),
    eq_trans H (eq_sym H) = eq_refl.
Proof.
  intros.
  destruct H.
  reflexivity.
Qed.

Definition trans_1p
: forall A (x y : A) (H : x = y),
    eq_trans eq_refl H = H.
Proof.
  intros.
  destruct H.
  reflexivity.
Qed.

Definition trans_p1
: forall A (x y : A) (H : x = y),
    eq_trans H eq_refl = H.
Proof.
  intros.
  destruct H.
  reflexivity.
Qed.

Definition trans_sym
: forall A (x y z : A) (H0 : x = y) (H1 : y = z),
    eq_sym (eq_trans H0 H1) = eq_trans (eq_sym H1) (eq_sym H0).
Proof.
  intros.
  destruct H0, H1.
  reflexivity.
Qed.
