package jni

/**
 * Created by ice1000 on 2017/2/4.

 * @author ice1000
 */
object Main {
	var fuck = 0
		external set
		external get

	external fun getSquared(origin: Int): Int

	external fun getSqrt(origin: Int): Int

	external fun newIntArray(len: Int): IntArray

	@JvmStatic
	fun main(args: Array<String>) {
		System.loadLibrary("dll")
		println(getSquared(16))
		println(getSquared(15))
		println(getSqrt(16))
		println(getSqrt(256))
		//		System.out.println(newIntArray(100).length);
		//		System.out.println(newIntArray(233).length);
	}
	//	public static native int[] discretization(int[] data);
	//
	//	public static void main(String[] args) {
	//		System.loadLibrary("jni");
	//		Random random = new Random(System.currentTimeMillis());
	//		int[] origin = new int[]{
	//				random.nextInt(233333),
	//				random.nextInt(233333),
	//				random.nextInt(233333),
	//				random.nextInt(233333),
	//				random.nextInt(233333),
	//				random.nextInt(233333),
	//				random.nextInt(233333),
	//				random.nextInt(233333)
	//		};
	//		System.out.println(Arrays.toString(origin));
	//		System.out.println(Arrays.toString(discretization(origin)));
	//		System.out.println(Arrays.toString(origin));
	//	}
}
