import 'package:belajar_rive_flutter/switch_day_night.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Belajar Rive Flutter"),
      ),
      body: Center(child: SwitchDayNight()),
    );
  }
}
