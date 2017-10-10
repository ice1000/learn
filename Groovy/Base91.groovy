class Base91 {

	private static final byte[] ENCODING_TABLE
	private static final byte[] DECODING_TABLE
	private static final int BASE
	private static final float AVERAGE_ENCODING_RATIO = 1.2297f

	static {
		ENCODING_TABLE = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!#\$%&()*+,./:;<=>?@[]^_`{|}~\"".getBytes()
		BASE = ENCODING_TABLE.length

		DECODING_TABLE = new byte[256]
		for (int i = 0; i < 256; ++i) DECODING_TABLE[i] = -1
		for (int i = 0; i < BASE; ++i) DECODING_TABLE[ENCODING_TABLE[i]] = (byte) i
	}

	static String encode(String data) {
		return new String(encode(data.getBytes()))
	}

	static byte[] encode(byte[] data) {
		int estimatedSize = (int) Math.ceil(data.length * AVERAGE_ENCODING_RATIO)
		def output = new ByteArrayOutputStream(estimatedSize)
		int ebq = 0
		int en = 0
		data.each { byte aData ->
			ebq |= (aData & 255) << en
			en += 8
			if (en > 13) {
				int ev = ebq & 8191
				if (ev > 88) {
					ebq >>= 13
					en -= 13
				} else {
					ev = ebq & 16383
					ebq >>= 14
					en -= 14
				}
				output.write(ENCODING_TABLE[ev % BASE])
				output.write(ENCODING_TABLE[(ev / BASE) as int])
			}
		}
		if (en > 0) {
			output.write(ENCODING_TABLE[ebq % BASE])
			if (en > 7 || ebq > 90) output.write(ENCODING_TABLE[(ebq / BASE) as int])
		}
		return output.toByteArray()
	}

	static String decode(String data) {
		return new String(decode(data.getBytes()))
	}

	static class Looper {
		private Closure code

		static Looper loop(Closure code) {
			new Looper(code: code)
		}

		void until(Closure test) {
			code()
			while (!test()) {
				code()
			}
		}
	}

	static byte[] decode(byte[] data) {
		if (data.length == 0) return []
		int dbq = 0
		int dn = 0
		int dv = -1
		int estimatedSize = Math.round(data.length / AVERAGE_ENCODING_RATIO)
		def output = new ByteArrayOutputStream(estimatedSize)

		for (int i = 0; i < data.length; ++i) {
			if (DECODING_TABLE[data[i]] == -1) continue
			if (dv == -1) dv = DECODING_TABLE[data[i]]
			else {
				dv += DECODING_TABLE[data[i]] * BASE
				dbq |= dv << dn
				dn += (dv & 8191) > 88 ? 13 : 14
				Looper.loop {
					output.write((byte) dbq)
					dbq >>= 8
					dn -= 8
				} until { dn <= 7 }
				dv = -1
			}
		}
		if (dv != -1) output.write((byte) (dbq | dv << dn))
		return output.toByteArray()
	}

}