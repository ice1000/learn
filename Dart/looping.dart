main(List<String> args) {
  var arr = [1, 2, 3];
  var fruits = ['banana', 'apple', 'orange'];

  arr.forEach((item) {
    print(item);
  });

  fruits.forEach((item) {
    print(item);
  });

  //USING ARROW
  fruits.forEach((item) => print(item));
  fruits.forEach((item) => print(fruits.indexOf(item)));
}
