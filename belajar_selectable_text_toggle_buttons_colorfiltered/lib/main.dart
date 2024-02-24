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
  List<bool> isSelected = [true, false, false];
  ColorFilter colorFilter = ColorFilter.mode(Colors.blue, BlendMode.screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorFiltered(
        colorFilter: colorFilter,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Belajar Selectable Text Toggle Buttons ColorFiltered"),
            backgroundColor: Colors.lightBlue,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectableText(
                  "belajar cara menggunakan selectable text toggle buttons colorfiltered",
                  style: TextStyle(fontSize: 20),
                  showCursor: true,
                  cursorWidth: 3,
                  cursorColor: Colors.red,
                ),
                SizedBox(
                  height: 10,
                ),
                ToggleButtons(
                  children: [
                    Icon(Icons.save),
                    Icon(Icons.edit),
                    Icon(Icons.delete),
                  ],
                  isSelected: isSelected,
                  onPressed: (index) {
                    setState(() {
                      if (index == 0)
                        colorFilter =
                            ColorFilter.mode(Colors.blue, BlendMode.screen);
                      else if (index == 1)
                        colorFilter =
                            ColorFilter.mode(Colors.green, BlendMode.softLight);
                      else
                        colorFilter =
                            ColorFilter.mode(Colors.purple, BlendMode.multiply);
                      for (int i = 0; i < isSelected.length; i++)
                        isSelected[i] = (i == index) ? true : false;
                    });
                  },
                  fillColor: Colors.red[50],
                  selectedColor: Colors.red,
                  selectedBorderColor: Colors.red,
                  splashColor: Colors.blue,
                  highlightColor: Colors.yellow,
                  borderRadius: BorderRadius.circular(15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
