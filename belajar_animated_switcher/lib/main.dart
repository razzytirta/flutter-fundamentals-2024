import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isON = false;
  Widget myWidget = Container(
    height: 100,
    width: 200,
    decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(
          color: Colors.black,
          width: 2,
        )),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Belajar Animated Switcher",
          ),
          backgroundColor: Colors.black26,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedSwitcher(
                child: myWidget,
                duration: Duration(
                  seconds: 1,
                ),
                transitionBuilder: (child, animation) => ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              ),
              Switch(
                activeColor: Colors.green,
                inactiveTrackColor: Colors.red[200],
                inactiveThumbColor: Colors.red,
                value: isON,
                onChanged: (newValue) {
                  isON = newValue;
                  setState(() {
                    if (isON) {
                      myWidget = SizedBox(
                        width: 200,
                        height: 100,
                        child: Center(
                          child: Text(
                            "Switch ON",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    } else {
                      myWidget = Container(
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                      );
                    }
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
