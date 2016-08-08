/**
 * @author ice1000
 * Created by ice1000 on 2016/8/8.
 */
class Exercise02 implements GroovyObject {

	@Override
	String toString() {
		return super.toString()
	}

	def cache = [0, 1, 1]

	def fib(int n) {
		if (cache[n] > 0) cache[n]
		else cache[n] = fib(n - 1) + fib(n - 2)
	}

	def run() {
		def scanner = new Scanner(System.in);
		def loop = true
		def input;
		while (loop) {
			input = scanner.nextInt()
			switch (input) {
				case -1:
				case 0:
					loop = false
					break
				default:
					println(fib(input))
					break
			}
		}
		scanner.close()
		this
	}

	def judge() {
		(1..100).each {
			print(fib(it) + " ")
		}
		this
	}

	public static void main(String[] args) {
		new Exercise02()
				.judge()
				.run()
	}
}
