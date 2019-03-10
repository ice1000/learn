void main(List<String> args) {
  int rating = 5;

  switch (rating) {
    case 5:
      print('very good');
      break;

    case 4:
      print('good');
      break;

    case 3:
      print('neutral');
      break;

    case 2:
      print('bad');
      break;

    default:
      print('very bad');
      break;
  }
}
