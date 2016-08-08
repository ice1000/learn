/**
 * @author ice1000
 * Created by ice1000 on 2016/8/8.
 */
class Exercise04 {

	@Override
	String toString() {
		"2333"
	}

	public static void main(String[] args) {
		def a = [2, 3, 3]
		a<<666
		println a[-1]

		def assWeCan = null

		println a ?: "Fuck"
		println assWeCan ?: "Fuck"
	}

}
