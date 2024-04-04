import 'dart:math';

class Person {
  String name;
  int _age;
  List<int> luckyNumbers;

  int get age => _age;
  set age(int value) {
    if (value < 0) {
      value *= -1;
    }
    _age = value;
  }

  Person() {
    name = "No Name";
    age = 0;
    Random r = Random();
    luckyNumbers = [];
    for (int i = 0; i < 3; i++) {
      luckyNumbers.add(r.nextInt(11));
    }
  }
}
