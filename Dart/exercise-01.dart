void printNumber(num n) {
  print('n = $n');
}

void main() {
  for (int i = 0; i <= 5; ++i) {
    print('Hello ${i + 1}');
  }
  const number = 233;
  final a = number;
//  const b = a;
  printNumber(a);
}
