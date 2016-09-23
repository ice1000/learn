/**
 * 柯里化练习
 */

class Method(val a: Int) {
	operator fun invoke(b: Int) = Method(a + b)
	operator fun invoke() = a
}

fun plus(a: Int) = Method(a)

fun main(args: Array<String>) {
	println(plus(1)(2)(3)(4)(5)(6)(7)())
	println(plus(1)(2)(3)(4)(5)(6)(7)
				(1)(2)(3)(4)(5)(6)(7)
				(1)(2)(3)(4)(5)(6)(7)
				(1)(2)(3)(4)(5)(6)(7)
				(1)(2)(3)(4)(5)(6)(7)
				(1)(2)(3)(4)(5)(6)(7)
				(1)(2)(3)(4)(5)(6)(7)
				(1)(2)(3)(4)(5)(6)(7)())
	println(plus(4)(3)(5)())
}