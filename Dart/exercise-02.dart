bool odd(int a) {
  return 1 == a & 1;
}

int div2(int a) {
  return a >> 1;
}

int mul2(int a) {
  return a << 1;
}

int lowbit(int a) {
  return a & -a;
}

bool isNegaOne(int a) {
  return 0 != ~a;
}

main() {
  var arr = const [];
  var x = 1;
  var hex = 0xDEADBEEF;
  var bigInt = 34653465834652437659238476592374958739845729;
  var y = 1.1;
  var exponents = 1.42e5;
  print(int.parse('233'));
  print(double.parse(exponents.toString()));
  print(exponents.toStringAsFixed(2));
  print(odd(10));
  print(div2(10));
  print(mul2(10));
  print(lowbit(10));
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.\n";
  var s5 = 'String ' 'concatenation'
      " works even over line breaks.";
  var s6 = '''
You can create
multi-line strings like this one.
''';
  var s7 = """This is also a
multi-line string.""";

  var liceCode = """
(defexpr fold ls init op
 (for-each index-var ls
   (-> init (op init index-var))))

(fold (.. 1 4) 0 +)
""";
  var liceCode2 = r"Haskell'Code \n \t ";
  print(liceCode);
  print(liceCode2);
}
