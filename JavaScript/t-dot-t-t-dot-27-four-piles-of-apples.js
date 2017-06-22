function fourPiles(n, y) {
		var x = n / (2 + y + 1.0 / y);
		if (x % y != 0 || x == y) return [];
		return [x + y, x - y, x * y, x / y];
}
