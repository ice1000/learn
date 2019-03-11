void main(List<String> args) {
  String strSatu = "string satu";
  String strDua = 'string dua';
  String strTiga = 'string ti\'ga';
  String strEmpat = 'Satu' + 'dua' + "tiga";

  String nama = "Muhammad Taqi";
  String namaSaya = "Nama saya adalah: $nama";

  print(strSatu);
  print(strDua);
  print(strTiga);
  print(strEmpat);
  print(namaSaya);

  print("Nama saya adalah ${nama}");
  print("Panjang huruf nama saya adalah " + nama.length.toString());
  print("Panjang huruf nama saya adalah ${nama.length}");
}
