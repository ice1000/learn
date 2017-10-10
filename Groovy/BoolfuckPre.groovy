class Brainfuck {

	public static final String lookup = "+-<>,.[]"
	public static final String[] translation = [
			">[>]+<[+<]>>>>>>>>>[+]<<<<<<<<<",
			">>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+]<<<<<<<<<",
			"<<<<<<<<<",
			">>>>>>>>>",
			">,>,>,>,>,>,>,>,<<<<<<<<",
			">;>;>;>;>;>;>;>;<<<<<<<<",
			">>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>[+<<<<<<<<[>]+<[+<]",
			">>>>>>>>>+<<<<<<<<+[>+]<[<]>>>>>>>>>]<[+<]"
	]

	static String toBoolfuck(String code) {
		StringBuilder brainfuck = new StringBuilder()
		int n = code.length()
		for (int i = 0; i < n; ++i)
			brainfuck.append(translation[lookup.indexOf((int) code.charAt(i))])
		return brainfuck.toString()
	}
}