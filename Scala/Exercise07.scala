/**
 * Created by ice1000 on 2016/10/26.
 */

trait Expr {
	def eval: Int
}

case class Num(n: Int) extends Expr {
	override def eval: Int = n
}

case class Neg(e: Expr) extends Expr {
	override def eval: Int = -e.eval
}

case class Add(e1: Expr, e2: Expr) extends Expr {
	override def eval: Int = e1.eval + e2.eval
}

object Main {
	def main(args: Array[String]): Unit = {
		println(Add(Neg(Num(233)), Num(666)).eval)
	}
}

