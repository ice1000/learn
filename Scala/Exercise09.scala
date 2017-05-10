import scala.collection.mutable

/**
 * Created by ice1000 on 2016/10/26.
 */

object Main {
	def main(args: Array[String]): Unit = {
		val ass = new FunctorImpl[Int](List(1, 2, 3, 4, 5))
		val we = ass.map(_ << 1)
		we foreach println
		println
		val can = we.map(_ << 1)
		can foreach println
		println
		val boy = can.map(_ << 1)
		boy foreach println
	}
}

class FunctorImpl[T](l: List[T]) extends Functor[T] {
	override def map[R](f: (T) => R): FunctorImpl[R] = {
		val ret: mutable.MutableList[R] = new mutable.MutableList[R]
		l.foreach(ret += f(_))
		new FunctorImpl[R](ret.toList)
	}
	def foreach[U](f: (T) => U): Unit = l.foreach(f)
}

trait Functor[T] {
	def identify[_](a: T) = a
	def map[R](f: T => R): Functor[R]
	implicit def turn[_](l: List[T]): Functor[T] = {
		new FunctorImpl[T](l)
	}
}


