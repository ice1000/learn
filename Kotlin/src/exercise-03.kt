import java.util.*

fun main(args: Array<String>) {
    var a:Int = (Math.random() * 100).toInt()
    var cnt = 0
    var scan :Scanner = Scanner(System.`in`)
    println("""
请猜一个0~100的数。
    """)
    while(true){
        var b = scan.nextInt()
        cnt += 1
        if(b == a) break
        println(
                if(b > a) "您猜的数大了。"
                else "您猜的数小了。"
        )
    }
    println("""
恭喜你~猜对了~您一共猜了 $cnt 次~
游戏结束~
    """)
}
