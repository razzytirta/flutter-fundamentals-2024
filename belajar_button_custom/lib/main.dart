import 'package:flutter/material.dart';
import 'colorful_button.dart';

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
          title: Text(
            "Colorful Buttons",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ColorfulButton(
                Colors.pink,
                Colors.blue,
                Icons.home,
              ),
              ColorfulButton(
                Colors.amber,
                Colors.red,
                Icons.comment,
              ),
              ColorfulButton(
                Colors.green,
                Colors.purple,
                Icons.people,
              ),
              ColorfulButton(
                Colors.blue,
                Colors.yellow,
                Icons.shopping_cart,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
