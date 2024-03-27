import 'package:belajar_mobx_state_management/mobx/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final CounterMobx counter = CounterMobx();

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Mobx Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(
              builder: (context) => Text(
                counter.value.toString(),
                style: TextStyle(fontSize: 30),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    counter.decrement();
                  },
                  child: Icon(Icons.arrow_downward),
                ),
                SizedBox(
                  width: 30,
                ),
                FloatingActionButton(
                  onPressed: () {
                    counter.increment();
                  },
                  child: Icon(Icons.arrow_upward),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
