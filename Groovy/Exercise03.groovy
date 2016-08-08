/**
 * @author ice1000
 * Created by ice1000 on 2016/8/8.
 */
class Exercise03 extends Object{

	def foo(String fuck) {
		println fuck
	}

	public void damn(n) {
		println(n.class)
	}

	def ass(Closure closure) {
		closure.run()
	}

	def fuck() {
		foo 'fuck'
		damn 233
		ass {
			foo """
I am an artist.
I am an performance artist.

ass we can"""
		}
	}

	Exercise03() {
		fuck()
	}

	public static void main(String[] args) {
		new Exercise03()
	}
}
