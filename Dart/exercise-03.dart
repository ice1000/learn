class BIT {
  List<int> bit = [0, 0, 0, 0, 0, 0, 0];

  BIT.init(this.bit);

  BIT.bySize(int size) {
    bit = new List<int>.filled(size, 0);
  }

  int _lowbit(int a) {
    return a & -a;
  }

  void add(int index, int value) {
    if (index < bit.length) {
      bit[index] += value;
      add(index + _lowbit(index), value);
    }
  }

  int sum(int index) {
    return index > 0 ? bit[index] + sum(index - _lowbit(index)) : 0;
  }
}

main() async {
  var bit = new BIT.init(new List.filled(100, 0));
  bit.add(3, 100);
  bit.add(4, 100);
  bit.add(5, 100);
  bit.add(6, 100);
  print(bit.sum(10));
}
