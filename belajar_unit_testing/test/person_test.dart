import 'package:belajar_unit_testing/person.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Person p;
  p = Person();

  group("Mengecek class Person", () {
    test("Inisialiasi Objek Person", () {
      print('test 1');
      expect(p.name, equals("No Name"));
      expect(p.age, equals(0));
    });

    test("Age harus positif", () {
      print('test');
      p.age = -5;
      expect(p.age, isPositive);
    });

    test("Angka keberuntungan harus 3 buah bilangan positif", () {
      print('test');
      expect(
          p.luckyNumbers,
          allOf([
            hasLength(equals(3)),
            isNot(anyElement(isNegative)),
          ]));
    });
  });

  setUp(() {
    print('set up');
  });

  tearDown(() {
    print('teardown');
  });
}
