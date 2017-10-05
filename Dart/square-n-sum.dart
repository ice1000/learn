int squareSum(List numbers) {
  return numbers.map((a) => a * a).fold(0, (a, b) => a + b);
}
