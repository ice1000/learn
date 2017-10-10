import org.junit.FixMethodOrder
import org.junit.Test
import org.junit.runners.MethodSorters

import java.util.regex.Matcher
import java.util.regex.Pattern

import static org.junit.Assert.*

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
class SolutionTest {

	@Test
	void test0_AntiCheat() {
		try {
			File f = new File("/home/codewarrior/solution.txt")
			BufferedReader b = new BufferedReader(new FileReader(f))
			String line = ""
			int length = 0
			while ((line = b.readLine()) != null) {
				checkSourceLine(line)
				length += sourceLength(line)
			}
			assertTrue(String.join("",
					"Seriously, you didn\'t believe me? You can\'t hard-code the answers! ",
					"Either that, or your solution is inefficient. Let\'s keep it under 5K, k? ",
					String.format("(Your code length: %d)", length)),
					length < 5000)
		} catch (IOException e) {
			e.printStackTrace()
			fail("Failed to read the source file.")
		}
	}

	private static void checkSourceLine(String line) {
		Pattern pattern = Pattern.compile("([^a-zA-Z0-9_]|^)(System|io|regex|zip)([^a-zA-Z0-9_]|\$)")
		Matcher matcher = pattern.matcher(line)
		if (matcher.find()) {
			fail("You\'re asking for trouble... (You cannot use System, io, regex, zip in your code)")
		}
	}

	private static int sourceLength(String line) {
		return line.trim().length()
	}

	@Test
	void test1_MainTest() {
		for (int n = 1; n <= 18; ++n) {
			testWithNumber(n)
		}
	}

	private static void testWithNumber(int n) {
		Solution solution = new Solution()
		String regex = solution.regexDivisibleBy(n)
		Random random = new Random()

		System.out.printf("Testing divisibility by %d...", n)
		assertFalse("Cannot be an empty string\n", regex.equals(""))

		Pattern pattern = Pattern.compile("[^01?*+^\$:()\\[\\]|]")
		Matcher matcher = pattern.matcher(regex)
		if (matcher.find()) {
			fail(String.format("Found an illegal character: %s\n", matcher.group()))
		}

		String[] invalidArgs = [
				" ",
				new String(Character.toChars(randInt(random, 97, 122))),
				new String(Character.toChars(randInt(random, 33, 45))),
				Integer.toString(randInt(random, 12, 91))
		]
		int[] validArgs = [
				0, n, n * randInt(random, 2, 50), randInt(random, 0, 999),
				randInt(random, 1000, 1 << 30), hardPositive(random, n)
		]

		pattern = Pattern.compile(regex)
		for (String invalidArg : invalidArgs) {
			matcher = pattern.matcher(invalidArg)
			assertFalse(String.format("Did not reject invalid input: %s\n", invalidArg),
					matcher.matches())
		}
		for (int arg : validArgs) {
			String numberToMatch = Integer.toBinaryString(arg)
			matcher = pattern.matcher(numberToMatch)
			assertEquals(String.format("Did not give correct answer for the number: %d\n", arg),
					matcher.matches(), arg % n == 0)
		}
		System.out.println(" Passed!")
	}

	private static int randInt(Random random, int min, int max) {
		return random.nextInt(max - min + 1) + min
	}

	private static int hardPositive(Random random, int n) {
		return (1 << randInt(random, 22, 30)) / n * n + n
	}
}
