/**
 * Created by ice1000 on 2016/11/30.
 *
 * @author ice1000
 */


class Method() {
	operator fun <T> invoke(param: T): Method = this

	operator fun invoke() = Unit

	operator fun <T> get(param: T): Method = this
}

fun <T, A, B, C, D> boy(block: (A, B, C, D) -> T) =
		{ param2: A ->
			{ param3: B ->
				{ param4: C ->
					{ param5: D ->
						block(param2, param3, param4, param5)
					}
				}
			}
		}

/**
 * fuck
 */
fun main(args: Array<String>) {
	val door = "uitewg"
	val ass = "sdf"
	val we = "fjeskf"
	val can = "3219847"
	val next = { x: String, y: String, z: String, w: String -> println("$x$y$z$w") }
	boy(next)(door)(ass)(we)(can)
	val method = Method()
	method(1)(3)[233](4)()
}
