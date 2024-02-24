import 'dart:ui';

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
          title: Text("Belajar Font Features"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Contoh 01 (Tanpa apapun)",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                "Contoh 02 (Small Caps)",
                style: TextStyle(
                    fontSize: 20, fontFeatures: [FontFeature.enable("smcp")]),
              ),
              Text(
                "Contoh 03 1/2 (Small Caps & Frac)",
                style: TextStyle(
                  fontSize: 20,
                  fontFeatures: [
                    FontFeature.enable("smcp"),
                    FontFeature.enable("frac"),
                  ],
                ),
              ),
              Text(
                "Contoh 04 Cardo (Tanpa Apapun)",
                style: TextStyle(
                  fontFamily: "Cardo",
                  fontSize: 20,
                ),
              ),
              Text(
                "Contoh 05 Cardo (Old Styles)",
                style: TextStyle(
                  fontFamily: "Cardo",
                  fontSize: 20,
                  fontFeatures: [
                    FontFeature.oldstyleFigures(),
                  ],
                ),
              ),
              Text(
                "Contoh 06 Gabriela (Default)",
                style: TextStyle(
                  fontFamily: "Gabriela",
                  fontSize: 20,
                ),
              ),
              Text(
                "Contoh 07 Gabriela (Style set nomor 5)",
                style: TextStyle(
                  fontFamily: "Gabriela",
                  fontSize: 20,
                  fontFeatures: [
                    FontFeature.stylisticSet(5),
                  ],
                ),
              ),
              Text(
                "Contoh Milonga 08 1/2 (Small Caps & Frac)",
                style: TextStyle(
                  fontFamily: "Milonga",
                  fontSize: 20,
                  fontFeatures: [
                    FontFeature.enable("smcp"),
                    FontFeature.enable("frac"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
