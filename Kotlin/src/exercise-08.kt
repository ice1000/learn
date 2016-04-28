/**
 * Created by asus1 on 2016/4/3.
 *
 */

fun check(a: Any){
    if(a is String) println("您传入了一个字符串。")
    else if(a is Int) println("您传入了一个整数。")
    else if(a is Double) println("您传入了一个双精度浮点。")
}

fun main(args: Array<String>) {
    var a = 1
    check(a)
    var b = "233"
    check(b)
    var c = 0.0
    check(c)
}