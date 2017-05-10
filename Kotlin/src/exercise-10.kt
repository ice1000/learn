/**
 * We declare a package-level function main which returns Unit and takes
 * an Array of strings as a parameter. Note that semicolons are optional.
 */

open class Test {
    private var a: Int
    constructor (){
        a = 0
    }
    constructor (a: Int){
        this.a = a
    }
    public fun p(){
        println(a)
    }
}

fun main(args: Array<String>) {
    println("Hello, world!")
    var a = Test(233);
    a.p()
    var b = Test();
    b.p()
}
