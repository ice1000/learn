
fun main(args: Array<String>) {
    println(getStringLength("aaa"))
    println(getStringLength("ass we can"))
    println(getStringLength(233))
    println(getStringLength(66666))
}

fun getStringLength(obj: Any): Int? {
    if (obj is String)
        return obj.length // no cast to String is needed
    else if(obj is Int)
    	return obj.toString().length
    else return null
}

// 感觉Kotlin挺聪明的
