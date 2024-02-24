import 'package:belajar_doc_comment/user_profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserProfile profile = UserProfile();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Belajar Doc Comment"),
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
          child: profile,
        ),
      ),
    );
  }
}
