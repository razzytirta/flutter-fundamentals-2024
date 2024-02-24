import 'package:belajar_provider_state_management/application_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<ApplicationColor>(
        create: (context) => ApplicationColor(),
        builder: (context, _) => Scaffold(
          appBar: AppBar(
            title: Consumer<ApplicationColor>(
              builder: (context, value, _) => Text(
                "Provider State Management",
                style: TextStyle(color: value.color),
              ),
            ),
            backgroundColor: Colors.black12,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<ApplicationColor>(
                  builder: (context, value, _) => AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    margin: EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    color: value.color,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(margin: EdgeInsets.all(5), child: Text("AB")),
                    Consumer<ApplicationColor>(
                      builder: (context, value, _) => Switch(
                          value: value.isLightblue,
                          onChanged: (newValue) {
                            value.isLightBlue = newValue;
                          }),
                    ),
                    Container(margin: EdgeInsets.all(5), child: Text("LB")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
