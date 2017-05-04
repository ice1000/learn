class SequenceSum {
  static String showSequence(num n) {
    var res = 0;
    if (n == 0) {
      return "0=0";
    }
    if (n < 0) {
      return "$n<0";
    }
    var str = new StringBuffer();
    for (int i = 0; i < n; i++) {
      str.write("$i+");
      res += i;
    }
    str.write("$n = ${res + n}");
    return str.toString();
  }
}
