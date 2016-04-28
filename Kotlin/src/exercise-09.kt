/**
 * We declare a package-level function main which returns Unit and takes
 * an Array of strings as a parameter. Note that semicolons are optional.
 */

fun main(args: Array<String>) {
    println("Hello, world!")
    var a = 1
    var b = a
    var c = 1
    println("a == b is " + (a == b))
    println("a === b is " + (a === b))
    println("a == c is " + (a == c))
    println("a === c is " + (a === c))
    var d = "233"
    var e = d
    var f = "233"
    println("d == e is " + (d == e))
    println("d === e is " + (d === e))
    println("d == f is " + (d == f))
    println("d === f is " + (d === f))
}
