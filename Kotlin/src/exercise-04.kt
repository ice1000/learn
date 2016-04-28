import java.util.*

/**
 * Created by asus1 on 2016/4/2.
 *
 */

fun max(a: Int, b: Int): Int{
    if(a > b) return a else return b
}

fun main(args: Array<String>){
    var a: Int
    var b: Int
    var scan = Scanner(System.`in`)
    a = scan.nextInt()
    b = scan.nextInt()
    println(
"""
您输入了 $a 和 $b ，其中较大的是 ${max(a, b)}
程序结束。
"""
    )
}