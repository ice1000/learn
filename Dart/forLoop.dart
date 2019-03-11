void main(List<String> args) {
  const List listNama = ['Taqi', 'Abdul', 'Aziz'];

  //BASIC PRINT
  for (int i = 0; i < 10; i++) {
    print('hello indonesia!');
  }

  for (var i = 0; i < 10; i++) {
    if (i % 2 == 0 && i != 0) {
      print('$i adalah bilangan genap!');
    }
  }

  for (var nama in listNama) {
    print(nama);
  }

  for (var i = 0; i < 10; i++) {
    var str = "";
    for (var j = 0; j < 10; j++) {
      str = '$str *';
    }
    print(str);
  }
}
