
open class A{
    constructor()

    open fun foo1(x: Int) = println(x)
    open fun foo2(y: Int, x: Int) = println(y)
}

interface  B{
    open fun foo2(a: Int, b: Int) = println("a + b = " + (a + b))
    open fun foo3(a: Int, b: Int) = println("a * b = " + (a * b))
}

class C:A, B {
    constructor()

    override fun foo2(a: Int, b: Int) {
        super<B>.foo2(a, b)
        super<A>.foo2(a, b)
    }
}

fun main(args: Array<String>) {
    var a = A()
//    var b = B()
    var c = C()
    a.foo1(2)
    c.foo2(2, 3)
    c.foo3(3, 2)
}