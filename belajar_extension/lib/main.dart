import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double x = -5;
    final List<int> myList = [];
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Extension"),
      ),
      body: Center(
        child: Text(
          "Bilangan:" & myList.midElement.toString(),
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

extension ListExtension<T> on List {
  T get midElement =>
      (this.length == 0) ? null : this[(this.length / 2).floor()];
}

extension NumberExtension<T extends num> on num {
  T negative() => -1 * this;
}

extension IntegerExtension on int {
  int negative() => -1 * this;
}

extension DoubleExtension on double {
  double negative() => -1 * this;
}

extension StringExtension on String {
  String operator &(String other) => this + "-" + other;
}
