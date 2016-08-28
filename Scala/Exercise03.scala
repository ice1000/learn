import java.util
import java.util.Scanner

/**
	* Created by ice1000 on 2016/8/27.
	*
	* fib
	*/
class Exercise03 extends Exercise02 {
	val list = new util.ArrayList[BigInt]()
	list.add(0)
	list.add(1)

	def ->(index: Int): BigInt = {
		if (index >= list.size()) (list.size() to index) foreach { x => list.add(list.get(x - 1) + list.get(x - 2)) }
		list get index
	}
}

object Exercise03 {
	def main(args: Array[String]): Unit = {
		val a = new Exercise03
		(1 to new Scanner(System.in).nextInt()) foreach { x =>
			println(a -> x)
		}
	}
}
