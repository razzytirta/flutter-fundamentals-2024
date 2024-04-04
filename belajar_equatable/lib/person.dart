import 'package:equatable/equatable.dart';

class BasePerson {}

class Person extends BasePerson with EquatableMixin {
  String name;
  int age;

  Person({this.name = "No Name", this.age = 0});

  // operator ==(other) {
  //   if (other is Person) {
  //     if (name == other.name && age == other.age) {
  //       return true;
  //     }
  //   }

  //   return false;
  // }

  @override
  // TODO: implement props
  List<Object> get props => [name, age];
}
