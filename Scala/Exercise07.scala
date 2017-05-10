/**
	* Created by ice1000 on 2016/10/26.
	*/

trait Expr {
	private var _eval = 0
	def eval: Int = _eval
	def eval_= (int: Int): Unit = {
		output()
		_eval = int
	}
	def output(): Unit = println(eval)
	implicit def turn(expr: Expr): Int = expr.eval
}

case class Num(n: Int) extends Expr {
	override def eval: Int = n
}

case class Neg(e: Expr) extends Expr {
	override def eval: Int = -e.eval
}

case class Plus(e1: Expr, e2: Expr) extends Expr {
	override def eval: Int = e1.eval + e2.eval
	output()
}

case class Minus(e1: Expr, e2: Expr) extends Expr {
	override def eval: Int = Plus(e1, Neg(e2))
	output()
}

case class Times(e1: Expr, e2: Expr) extends Expr {
	override def eval: Int = e1 * e2
	output()
}

case class DividedBy(e1: Expr, e2: Expr) extends Expr {
	override def eval: Int = e1 / e2
}

object Main {
	def main(args: Array[String]): Unit = {
		Plus(Neg(Num(233)), Num(666))
	}
}

