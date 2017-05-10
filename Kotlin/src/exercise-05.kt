/**
 * Created by asus1 on 2016/4/2.
 *
 */

open class Test1 constructor(){
    var x = 0
    var y = 0
    init {
        x = 0
        y = 0
    }

    fun printX(){
        println(x)
    }

    fun printY(){
        println(y)
    }
}

fun main(args: Array<String>){
    var a = Test1()
    a.printX()
    a.printY()
}