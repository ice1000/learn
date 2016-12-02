import java.util.*

/**
 * Created by ice1000 on 2016/11/29.
 *
 * @author ice1000
 */

object Monoid {
	fun <T> combine(func: (T, T) -> T) = { i: T, j: T -> func(i, j) }
}

interface Functor {
	companion object {
		fun <T> map(func: (T) -> T) = { i: T -> func(i) }
	}
}

/**
 * Kotlin's type system is still weaker that Scala's one.
 */
class Monad<T>(val unitValue: T) : Functor {
	val unit: T by lazy { unitValue }

	fun map(func: (T) -> T) {
	}

	fun flatMap(func: (T) -> T) {
	}
}

fun <T> T.output(): T {
	println(this)
	return this
}

fun <T> T.mustEqualsTo(to: T) = if (this == to) Unit else throw AssertionError("not equal")

fun main(args: Array<String>) {
	val plus = { i: Int, j: Int -> i + j }
	val minus = { i: Int, j: Int -> i - j }

	val random = Random(System.currentTimeMillis())
	val randomBound = 0x1000

	(1..20).forEach { i ->
		println("example $i:")
		val ass = random.nextInt(randomBound)
		val we = random.nextInt(randomBound)
		print("$ass + $we = ")
		Monoid.combine(plus)(ass, we)
				.output()
				.apply { mustEqualsTo(ass + we) }
		print("$ass - $we = ")
		Monoid.combine(minus)(ass, we)
				.output()
				.apply { mustEqualsTo(ass - we) }
		println()
	}
}

