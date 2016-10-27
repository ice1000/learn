/**
	* Created by ice1000 on 2016/10/26.
	*/

trait Expr {
	private var _eval = 0
	def eval: Int = {
		println(_eval)
		_eval
	}
	def eval_= (int: Int): Unit = {
		println(_eval)
		_eval = int
	}
	implicit def turn(expr: Expr): Int = expr.eval
}

case class Num(n: Int) extends Expr {
	eval = n
}

case class Neg(e: Expr) extends Expr {
	eval = -e.eval
}

case class Plus(e1: Expr, e2: Expr) extends Expr {
	eval = e1.eval + e2.eval
}

case class Minus(e1: Expr, e2: Expr) extends Expr {
	eval = Plus(e1, Neg(e2))
}

case class Times(e1: Expr, e2: Expr) extends Expr {
	 eval = e1 * e2
}

case class DividedBy(e1: Expr, e2: Expr) extends Expr {
	 eval = e1 / e2
}

object Main {
	def main(args: Array[String]): Unit = {
		Plus(Neg(Num(233)), Num(666))
	}
}

