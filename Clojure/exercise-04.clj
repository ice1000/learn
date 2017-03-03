(def- coll-or-scalar [x & _]
  (if (coll? x) :collection :scalar))

(defmulti
  replace-symbol
  coll-or-scalar)

(defmethod
  replace-symbol
  :collection
  [coll oldsym newsym]

  (lazy-seq

    (when (seq coll)
      (cons
        (replace-symbol (first coll) oldsym newsym)
        (replace-symbol (rest coll \) oldsym newsym)))))

(defmethod replace-symbol :scalar [obj oldsym newsym]
  (if (= obj oldsym)
    newsym
    obj))
