/**
 * Created by Max on 2017/3/17.
 *
 * @author ice1000
 */
package lice.parse


sealed class Option<out T> {
    object None : Option<Nothing>() {
        override fun toString() = "None"
    }

    class Some<out T>(val obj: T) : Option<T>() {
        override fun toString() = obj.toString()
    }
}

interface Parser<in T> {
    fun parse(code: T): Option<*>
}

class CharParser(val char: Char) : Parser<Char> {
    override fun parse(code: Char) = if (code == char) Option.Some(code) else Option.None
}

class StringParser(val string: String) : Parser<String> {
    override fun parse(code: String) = if (code == string) Option.Some(code) else Option.None
}

class OptionalParser<in T>(val first: Parser<T>, val second: Parser<T>) : Parser<T> {
    override fun parse(code: T): Option<*> {
        val res = first.parse(code)
        return if (res !is Option.None) res else second.parse(code)
    }
}

//class CombinedParser<in T>(val first: Parser<T>, val second: Parser<T>) : Parser<T> {
//    override fun parse(code: T): Option<*> {
//    }
//}

class RegexpParser(val regex: Regex) : Parser<String> {
    constructor(regex: String) : this(Regex(regex))

    override fun parse(code: String) = if (regex.matches(code)) Option.Some(code) else Option.None
}

class Token(content: String)

@Suppress("NOTHING_TO_INLINE")
inline fun <T> T.println() = println(this)

fun main(args: Array<String>) {
    val leftBrace = CharParser('(')
    val rightBrace = CharParser(')')
    val regParser = RegexpParser(Regex("([ ,\n\t\r]|，)+"))
    regParser.parse(", , ，\r\t\n   ").println()
    regParser.parse(", , ，   |").println()
    leftBrace.parse('(').println()
    leftBrace.parse(' ').println()
    rightBrace.parse(')').println()
}

