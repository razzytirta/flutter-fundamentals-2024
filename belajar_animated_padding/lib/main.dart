import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double myPadding = 5;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Belajar Animated Padding"),
          backgroundColor: Colors.black26,
        ),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: AnimatedPadding(
                      duration: const Duration(seconds: 1),
                      padding: EdgeInsets.all(myPadding),
                      child: GestureDetector(
                        onTap: () {
                          myPadding = 20;
                          setState(() {});
                        },
                        child: Container(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: AnimatedPadding(
                      duration: const Duration(seconds: 1),
                      padding: EdgeInsets.all(myPadding),
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: AnimatedPadding(
                      duration: const Duration(seconds: 1),
                      padding: EdgeInsets.all(myPadding),
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: AnimatedPadding(
                      duration: const Duration(seconds: 1),
                      padding: EdgeInsets.all(myPadding),
                      child: Container(
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
