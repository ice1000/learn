import static java.math.BigInteger.ZERO
import static java.math.BigInteger.valueOf

class Faberge {
		static BigInteger height(BigInteger n, BigInteger m) {
				if (n == ZERO || m == ZERO) return ZERO
				if (n > m) n = m
				BigInteger c = valueOf(1)
				BigInteger b = valueOf(1)
				BigInteger a = valueOf(0)
				while (c <= n) {
						BigInteger d = (m.add(valueOf(1)).subtract(c) * b).divide(c)
						c = c.add(valueOf(1))
						b = d
						a = a.add(d)
				}
				return a
		}
}
