import 'package:belajar_equatable/person.dart';

void main() {
  Person p = Person(name: "Razzi", age: 25);
  if (p == Person(name: "Razzi", age: 25)) {
    print("Sama");
  } else {
    print("Tidak Sama");
  }

  List<Person> persons = [p];
  if (persons.contains(Person(name: "Razzi", age: 25))) {
    print("Ada");
  } else {
    print("Tidak Ada");
  }
}
