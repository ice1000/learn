/**
 * Created by asus1 on 2016/4/3.
 */

open class Test2{
    protected  var a: Int
    constructor(a: Int){
        this.a = a
    }
    open fun say() = println(a)
}

class TestExtend :Test2{
    constructor(a: Int) :super(a){
    }
    override fun say() = print("extended:" + a.toString())
}

fun main(args: Array<String>) {
    var x = Test2(1)
    x.say()
    var y = TestExtend(2)
    y.say()
}