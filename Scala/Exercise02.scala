/**
	* Created by ice1000 on 2016/8/27.
	*/
class Exercise02 {

	var fuck = 1

	def foo(int: Int) = {
		println(s"fuck = $fuck, int = $int")
	}
}

object Exercise02 {
	def main(args: Array[String]): Unit = {
		val a = new Exercise02()
		a foo 233
		a.fuck = 100
		a foo 233
	}
}