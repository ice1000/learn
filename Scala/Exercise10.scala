import java.util.Scanner

/**
 * Created by ice1000 on 2016/10/26.
 */

object Main {
	def main(args: Array[String]): Unit = {
		val shit = new Scanner(System.in)
		while (true) {
			println(shit.nextInt() match {
				case 233 => "ass we can"
				case 666 => "boy next door"
				case 450 => "What the hell you're doing here"
				case _ => "Ah i'm fucking coming"
			})
		}
	}
}
