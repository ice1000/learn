/**
	* Created by ice1000 on 2016/8/28.
	*/
class Exercise05(val a: Int, val b: Int) {
	val c = a + b

	def abc(char: Char): Exercise05 = {
		println("invoked abc")
		this
	}

	def ghi(char: Char): Exercise05 = {
		println("invoked ghi")
		this
	}

	def !() = println("fuck")
}

object Exercise05 {
	def main(args: Array[String]): Unit = {
		val fuck = new Exercise05(1, 2)
		fuck abc '蛤'
		fuck.abc('蛤')
		fuck abc '蛤' ghi '哈'
		fuck ghi '2' abc '2'
	}
}