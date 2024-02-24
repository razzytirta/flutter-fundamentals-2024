import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nameController = TextEditingController(text: "No Name");
  bool isON = false;

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", nameController.text);
    prefs.setBool("isON", isON);
  }

  Future<String> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("name") ?? "No Name";
  }

  Future<bool> getON() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isON") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Belajar Shared Preference Example"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: nameController,
            ),
            Switch(
              value: isON,
              onChanged: (value) {
                setState(() {
                  isON = value;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  saveData();
                },
                child: Text("Save")),
            ElevatedButton(
                onPressed: () {
                  getName().then((value) => nameController.text = value);
                  setState(() {});
                  getON().then((value) {
                    isON = value;
                    setState(() {});
                  });
                },
                child: Text("Load")),
          ],
        ),
      ),
    );
  }
}
