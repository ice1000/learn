import org.junit.Test
import static org.junit.Assert.assertEquals
import org.junit.runners.JUnit4
import java.util.Collections

class BoolfuckTest {
	public static final String[] programs = [
			">,>,>,>,>,>,>,>,>>,>,>,>,>,>,>,>,<<<<<<<<+<<<<<<<<+[>+]<[<]>>>>>>>>>[+<<<<<<<<[>]+<[+<]>>>>>>>>>>>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+<<<<<<<<[>]+<[+<]>>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+]>[>]+<[+<]>>>>>>>>>[+]>[>]+<[+<]>>>>>>>>>[+]<<<<<<<<<<<<<<<<<<+<<<<<<<<+[>+]<[<]>>>>>>>>>]<[+<]>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+<<<<<<<<[>]+<[+<]>>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+]<<<<<<<<<<<<<<<<<<<<<<<<<<[>]+<[+<]>>>>>>>>>[+]>>>>>>>>>>>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>]<[+<]<<<<<<<<<<<<<<<<<<+<<<<<<<<+[>+]<[<]>>>>>>>>>[+]+<<<<<<<<+[>+]<[<]>>>>>>>>>]<[+<]>>>>>>>>>>>>>>>>>>>;>;>;>;>;>;>;>;<<<<<<<<",
			";;;+;+;;+;+;+;+;+;+;;+;;+;;;+;;+;+;;+;;;+;;+;+;;+;+;;;;+;+;;+;;;+;;+;+;+;;;;;;;+;+;;+;;;+;+;;;+;+;;;;+;+;;+;;+;+;;+;;;+;;;+;;+;+;;+;;;+;+;;+;;+;+;+;;;;+;+;;;+;+;+;"
	]

	@Test
	void testEmpty() {
		assertEquals(Boolfuck.interpret("", ""), "")
		assertEquals(Boolfuck.interpret(Brainfuck.toBoolfuck(""), ""), "")
	}

	@Test
	void testSingleCommands() {
		assertEquals(Boolfuck.interpret("<", ""), "")
		assertEquals(Boolfuck.interpret(">", ""), "")
		assertEquals(Boolfuck.interpret("+", ""), "")
		assertEquals(Boolfuck.interpret(".", ""), "")
		assertEquals(Boolfuck.interpret(";", ""), "\u0000")
	}

	@Test
	void testIO() {
		assertEquals(Boolfuck.interpret(Brainfuck.toBoolfuck(",."), "*"), "*")
	}

	@Test
	void testHelloWorld() {
		assertEquals(Boolfuck.interpret(";;;+;+;;+;+;+;+;+;+;;+;;+;;;+;;+;+;;+;;;+;;+;+;;+;+;;;;+;+;;+;;;+;;+;+;+;;;;;;;+;+;;+;;;+;+;;;+;+;;;;+;+;;+;;+;+;;+;;;+;;;+;;+;+;;+;;;+;+;;+;;+;+;+;;;;+;+;;;+;+;+;", ""), "Hello, world!\n")
	}

	@Test
	void testBasic() {
		assertEquals(Boolfuck.interpret(">,>,>,>,>,>,>,>,<<<<<<<[>]+<[+<]>>>>>>>>>[+]+<<<<<<<<+[>+]<[<]>>>>>>>>>[+<<<<<<<<[>]+<[+<]>>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+]<<<<<<<<;>;>;>;>;>;>;>;<<<<<<<,>,>,>,>,>,>,>,<<<<<<<[>]+<[+<]>>>>>>>>>[+]+<<<<<<<<+[>+]<[<]>>>>>>>>>]<[+<]", "Codewars\u00ff"), "Codewars")
		assertEquals(Boolfuck.interpret(">,>,>,>,>,>,>,>,>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+<<<<<<<<[>]+<[+<]>;>;>;>;>;>;>;>;>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+<<<<<<<<[>]+<[+<]>>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+]+<<<<<<<<+[>+]<[<]>>>>>>>>>]<[+<]>,>,>,>,>,>,>,>,>+<<<<<<<<+[>+]<[<]>>>>>>>>>]<[+<]", "Codewars"), "Codewars")
		assertEquals(Boolfuck.interpret(">,>,>,>,>,>,>,>,>>,>,>,>,>,>,>,>,<<<<<<<<+<<<<<<<<+[>+]<[<]>>>>>>>>>[+<<<<<<<<[>]+<[+<]>>>>>>>>>>>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+<<<<<<<<[>]+<[+<]>>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+]>[>]+<[+<]>>>>>>>>>[+]>[>]+<[+<]>>>>>>>>>[+]<<<<<<<<<<<<<<<<<<+<<<<<<<<+[>+]<[<]>>>>>>>>>]<[+<]>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+<<<<<<<<[>]+<[+<]>>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+]<<<<<<<<<<<<<<<<<<<<<<<<<<[>]+<[+<]>>>>>>>>>[+]>>>>>>>>>>>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>]<[+<]<<<<<<<<<<<<<<<<<<+<<<<<<<<+[>+]<[<]>>>>>>>>>[+]+<<<<<<<<+[>+]<[<]>>>>>>>>>]<[+<]>>>>>>>>>>>>>>>>>>>;>;>;>;>;>;>;>;<<<<<<<<", "\u0008\u0009"), "\u0048")
	}

	@Test
	void testShould_work_for_alternative_Hello_World_programs() {
		assertEquals(Boolfuck.interpret(Brainfuck.toBoolfuck("++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+."), ""), "Hello World!")
		assertEquals(Boolfuck.interpret(Brainfuck.toBoolfuck("++++++++++[>+++>+++++++>+++++++++>++++++++++>+++++++++++<<<<<-]>>++.>>+.>--..+++.<<<<++.>>---.>>.+++.------.<-.<<<+."), ""), "Hello World!")
		assertEquals(Boolfuck.interpret(Brainfuck.toBoolfuck("++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++."), ""), "Hello World!\n")
		assertEquals(Boolfuck.interpret(Brainfuck.toBoolfuck(">++++++++[-<+++++++++>]<.>>+>-[+]++>++>+++[>[->+++<<+++>]<<]>-----.>->+++..+++.>-.<<+[>[+>+]>>]<--------------.>>.+++.------.--------.>+.>+."), ""), "Hello World!\n")
	}

	@Test
	void testShould_ignore_all_non_command_characters() {
		assertEquals(Boolfuck.interpret(";;;+;+;;+;+; Goodbye world+;+;+ :p ;+;; TROLOLOLOL +;;+;;;+; :D ;+ ;) +;;+;;;+; (( ;+ GET REKT MUHAHAHA ;+; ))) ;+;        ((((+;;;;NOOOOOOO+;+;;+;;;+;DONT;+ REK;+; MAH+;;     PROGRAM;;;Boolf**k is awesome;;+;+;;+;;;+;Yes lets try some exclamation marks!!!!!+;;;+;+;;;;+sldkfjdsk l d f j  mmxmn x ci    wour;+;;+;;+;+;;sdfmsbdmsnbs+;;;+;;;+;;+;sfsdd+;;+ertet;rtyrtytry;;+;+;;+;;+;+;+;;rtrtyrty;;+;rtrrtyy+;;;+;rtyqeweqwq+;+;", ""), "Hello, world!\n")
		assertEquals(Boolfuck.interpret(";;;+;+;;+;+; Goodbye world+;+;+ :p ;+;; TR..O.L.O.L.O..LOL +;;+;;;+;.... :..D ;+ ;) +;;+...;;;+; (( ;+. ..GET REKT MUHAH..AHA ;+; ))) ;+;        ((((+;;;-;-NOO-OO--OOO+;+;;+;;;+;DONT;+ -REK;+; MAH+;;     PROGRAM;;;Boolf**k-...--..--.-.....--...--- is -..--....---awesome;;+;+;;+;;---..-.-.-..----....;+;Yes lets try.-.-.-.- some exclamation marks!!!!!+;;;+;+;;;;+sldkf..-.-..--.-.jd.--..s-k.-.-.- l d f j  mmxmn x ci    wour;+;;+;;+;+;;sdfms.--..-bdms.-.nbs+;;;+;;;+;;+;sfsdd+;;+ertet;   ..-..-.--.-.---.-.-.-...--..----.-.-.-.-----.-..-...-.-.--rtyrtytry;;+-;+-;;-+;;-+;+;+;;rtrtyrty;;-+-;rtrrtyy-+-;;;+--;rtyqeweqwq----+;+----;", ""), "Hello, world!\n")
	}

	@Test
	void testShould_expand_the_tape_in_either_direction_when_necessary() {
		assertEquals(Boolfuck.interpret(Brainfuck.toBoolfuck("--<-<<+[+[<+>--->->->-<<<]>]<<--.<++++++.<<-..<<.<+.>>.>>.<<<.+++.>>.>>-.<<<+."), ""), "Hello, World!")
		assertEquals(Boolfuck.interpret(String.join("", Collections.nCopies(26, "<")) + programs[1], ""), "Hello, world!\n")
		assertEquals(Boolfuck.interpret(programs[1] + String.join("", Collections.nCopies(21, ">")), ""), "Hello, world!\n")
	}

	@Test
	void testShould_correctly_multiply_any_two_non_negative_integers_together_for_products_up_to_and_including_255() {
		assertEquals(Boolfuck.interpret(programs[0], "\u0001\u0001"), "\u0001")
		assertEquals(Boolfuck.interpret(programs[0], "\u0002\u0004"), "\u0008")
		assertEquals(Boolfuck.interpret(programs[0], "\u0004\u0002"), "\u0008")
		assertEquals(Boolfuck.interpret(programs[0], "\u0005\u0003"), "\u000f")
		assertEquals(Boolfuck.interpret(programs[0], "\u0003\u0005"), "\u000f")
		assertEquals(Boolfuck.interpret(programs[0], "\u0009\u0008"), "\u0048")
		assertEquals(Boolfuck.interpret(programs[0], "\r\u000c"), "\u009c")
		assertEquals(Boolfuck.interpret(programs[0], "\u000f\u000c"), "\u00b4")
		assertEquals(Boolfuck.interpret(programs[0], "\u0000\r"), "\u0000")
		assertEquals(Boolfuck.interpret(programs[0], "\u000f\u000f"), "\u00e1")
		assertEquals(Boolfuck.interpret(programs[0], "\u0001\u00ff"), "\u00ff")
		String f = "", p = ""
		char r = (char) (Math.random() * 16), m = r
		f += r; r = (char) (Math.random() * 16); f += r
		m *= r; p += m
		assertEquals(Boolfuck.interpret(programs[0], f), p)
	}

	@Test
	void testShould_properly_interpret_a_CAT_program_with_a_random_string() {
		String c = ""
		for (int i = 0; i < 8; ++i) c += 33 + Math.random() * (126 - 33)
		assertEquals(Boolfuck.interpret(">,>,>,>,>,>,>,>,>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+<<<<<<<<[>]+<[+<]>;>;>;>;>;>;>;>;>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+<<<<<<<<[>]+<[+<]>>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+]+<<<<<<<<+[>+]<[<]>>>>>>>>>]<[+<]>,>,>,>,>,>,>,>,>+<<<<<<<<+[>+]<[<]>>>>>>>>>]<[+<]", c), c)
	}

	@Test
	void testShould_properly_interpret_a_CAT_program_with_a_large_random_string() {
		StringBuilder c = new StringBuilder()
		for (int i = 0; i < 60; ++i)
			c.append(33 + Math.random() * (126 - 33))
		assertEquals(Boolfuck.interpret(">,>,>,>,>,>,>,>,>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+<<<<<<<<[>]+<[+<]>;>;>;>;>;>;>;>;>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+<<<<<<<<[>]+<[+<]>>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+]+<<<<<<<<+[>+]<[<]>>>>>>>>>]<[+<]>,>,>,>,>,>,>,>,>+<<<<<<<<+[>+]<[<]>>>>>>>>>]<[+<]", c.toString()), c.toString())
	}

	@Test
	void testShould_properly_interpret_a_Fibonacci_program() {
		assertEquals(Boolfuck.interpret(Brainfuck.toBoolfuck(",>+>>>>++++++++++++++++++++++++++++++++++++++++++++>++++++++++++++++++++++++++++++++<<<<<<[>[>>>>>>+>+<<<<<<<-]>>>>>>>[<<<<<<<+>>>>>>>-]<[>++++++++++[-<-[>>+>+<<<-]>>>[<<<+>>>-]+<[>[-]<[-]]>[<<[>>>+<<<-]>>[-]]<<]>>>[>>+>+<<<-]>>>[<<<+>>>-]+<[>[-]<[-]]>[<<+>>[-]]<<<<<<<]>>>>>[++++++++++++++++++++++++++++++++++++++++++++++++.[-]]++++++++++<[->-<]>++++++++++++++++++++++++++++++++++++++++++++++++.[-]<<<<<<<<<<<<[>>>+>+<<<<-]>>>>[<<<<+>>>>-]<-[>>.>.<<<[-]]<<[>>+>+<<<-]>>>[<<<+>>>-]<<[<+>-]>[<+>-]<<<-]"), "\n"), "1, 1, 2, 3, 5, 8, 13, 21, 34, 55")
	}
}