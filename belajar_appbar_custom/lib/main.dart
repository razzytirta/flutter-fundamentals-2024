import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.pink[400],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.all(20),
              child: Text(
                "Belajar Custom Appbar Flutter",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
