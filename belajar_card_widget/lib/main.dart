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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
              ),
            ),
            title: Text(
              "Belajar Card Widget",
              style: TextStyle(),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                ),
              ),
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff4b7447),
                    Color(0xff8eba43),
                  ],
                  begin: FractionalOffset.bottomLeft,
                  end: FractionalOffset.bottomRight,
                ),
              ),
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(15),
            child: ListView(
              children: [
                BuildCard(
                  iconData: Icons.person_pin,
                  text: "Account",
                ),
                BuildCard(
                  iconData: Icons.message_rounded,
                  text: "Inbox",
                ),
                BuildCard(
                  iconData: Icons.compass_calibration_sharp,
                  text: "Beranda",
                ),
                BuildCard(iconData: Icons.shopping_cart, text: "Cart"),
              ],
            ),
          )),
    );
  }
}

class BuildCard extends StatelessWidget {
  final IconData? iconData;
  final String? text;

  const BuildCard({this.iconData, this.text, super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Icon(iconData),
          ),
          Text(text!)
        ],
      ),
    );
  }
}
