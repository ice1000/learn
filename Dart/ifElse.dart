void main() {
  // 1.
  int money = 15250000;
  var position = "Project Manager";

  if (money > 15000000 && position == "Project Manager") {
    print("Gaji kamu besar");
  } else if (money == 15000000 && position == "Fullstack Developer") {
    print("Gaji kamu lumayan besar");
  }

  // 2.
  int nilai = 100;
  nilai > 90
      ? print("Kamu graduate & mendapatankan honor!")
      : print("Kamu graduate!");

  var lulus = nilai >= 80 ? true : false;
  print(lulus);

  // 3. Known as Ternary in javascript
  String name = "Taqi";

  String status = name ?? "a user";
  print(status);
}
