import java.util.ArrayList

class Boolfuck {

	public static final char[] bits = [1, 2, 4, 8, 16, 32, 64, 128]

	static String interpret(String code, String input) {
		int oc = 0, ic = 0, ii = 0, inn = input.length(), tp = 0
		char i = 0, o = 0
		ArrayList<Boolean> tape = new ArrayList<Boolean>(256)
		tape.add(false)
		StringBuilder output = new StringBuilder()
		int e = code.length()
		for (int c = 0; c < e; ++c) {
			switch (code.charAt(c)) {
				case '<':
					if (--tp < 0) {
						tape.add(0, false)
						tp = 0
					}
					break
				case '>':
					tape.add(++tp < 0)
					break
				case '+':
					tape.set(tp, !(tape.get(tp)))
					break
				case '[':
					if (!tape.get(tp)) {
						int b = 1; while (b != 0 && ++c < e) {
							if (code.charAt(c) == '[') ++b else if (code.charAt(c) == ']') --b
						}
					}
					break
				case ']':
					if (tape.get(tp)) {
						int b = -1; while (b != 0 && --c >= 0) {
							if (code.charAt(c) == '[') ++b else if (code.charAt(c) == ']') --b
						}
					}
					break
				case ',':
					if (--ic < 0) {
						i = ii < inn ? input.charAt(ii++) : 0
						ic = 7
					}
					tape.set(tp, (i & 1) > 0)
					i = (char) (i >> 1)
					break
				case ';':
					if (tape.get(tp)) o |= bits[oc]
					if (++oc > 7) {
						output.append(o)
						o = 0
						oc = 0
					}
					break
			}
		}
		if (oc > 0) output.append(o)
		return output.toString()
	}
}