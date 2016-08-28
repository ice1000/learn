import scala.util.Random

/**
	* 定义三目运算符
	* Created by ice1000 on 2016/8/28.
	*
	* @author ice1000
	*/
class Exercise04

object Exercise04 {

	class Couple(val any1: Int, val any2: Int)

	implicit class MyBoolean(boolean: Boolean) {
		def ?(couple: Couple) = if (boolean) couple.any1 else couple.any2

		def abc(couple: Couple) = this ? couple
	}

	implicit class MyAny(self: Int) {
		def ::(any: Int) = new Couple(any, self)

		def fuck(any: Int) = ::(any)
	}

	def main(args: Array[String]): Unit = {
		while (true) println(Random.nextBoolean() abc 1 :: 2)

		Random.nextBoolean() ? (1 :: 2)
		Random.nextBoolean() abc 1 :: 2
	}
}

