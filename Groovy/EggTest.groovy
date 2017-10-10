import java.math.BigInteger
import java.util.Random

import static java.math.BigInteger.ZERO
import static java.math.BigInteger.valueOf
import static org.junit.Assert.*

class FabergeTest {
	static class FabergeTester {
		static BigInteger height(BigInteger n, BigInteger m) {
			if (n.equals(ZERO) || m.equals(ZERO)) return ZERO
			if (n.compareTo(m) > 0) n = m
			BigInteger c = valueOf(1)
			BigInteger b = valueOf(1)
			BigInteger a = valueOf(0)
			while (c.compareTo(n) <= 0) {
				BigInteger d = m.add(valueOf(1)).subtract(c).multiply(b).divide(c)
				c = c.add(valueOf(1))
				b = d
				a = a.add(d)
			}
			return a
		}
	}

	private static void test(int a, int b, int shouldBe) {
		assertEquals(valueOf(shouldBe), Faberge.height(valueOf(a), valueOf(b)))
	}

	private static void test(String a, String b, String shouldBe) {
		assertEquals(new BigInteger(shouldBe), Faberge.height(new BigInteger(a), new BigInteger(b)))
	}

	private static void test(String a, String b) {
		assertEquals(FabergeTester.height(new BigInteger(a), new BigInteger(b)), Faberge.height(new BigInteger(a), new BigInteger(b)))
	}

	@org.junit.Test
	void basicTests() {
		test(1, 51, 51)
		test(2, 1, 1)
		test(4, 17, 3213)
		test(16, 19, 524096)
		test(23, 19, 524287)
	}

	@org.junit.Test
	void advancedTests() {
		test("13", "550", "60113767426276772744951355")
		test("271", "550", "1410385042520538326622498273346382708200418583791594039531058458108130216985983794998105636900856496701928202738750818606797013840207721579523618137220278767326000095")
		test("531", "550", "3685510180489786476798393145496356338786055879312930105836138965083617346086082863365358130056307390177215209990980317284932211552658342317904346433026688858140133147")
	}

	@org.junit.Test
	void seriousTests() {
		test("311", "10131")
		test("6511", "11731")
		test("11111", "12911")
		test("99999", "13911")
	}

	@org.junit.Test
	void randomTests() {
		Random random = new Random(System.currentTimeMillis())
		test(random.nextInt(20000) + "", random.nextInt(20000) + "")
	}
}
