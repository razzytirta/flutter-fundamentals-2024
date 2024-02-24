import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Belajar Media Query"),
          centerTitle: true,
        ),
        body: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                children: generateContainers(),
              )
            : Row(
                children: generateContainers(),
              ),
      ),
    );
  }

  List<Widget> generateContainers() {
    return [
      // Container(
      //   color: Colors.red,
      //   width: MediaQuery.of(context).size.width / 3,
      //   height: MediaQuery.of(context).size.height / 2,
      // )
      Container(
        color: Colors.red,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.green,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.blue,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.yellow,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.grey,
        height: 100,
        width: 100,
      ),
    ];
  }
}
