import 'package:flutter/material.dart';

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

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Person> persons = [
    Person("Andhi"),
    Person("Sofian"),
    Person("Catur"),
  ];

  Person selectedPerson;

  List<DropdownMenuItem> generateItems(List<Person> persons) {
    List<DropdownMenuItem> items = [];

    for (var item in persons) {
      items.add(
        DropdownMenuItem(
          child: Text(item.name),
          value: item,
        ),
      );
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Dropdown Button"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: DropdownButton(
              isExpanded: true,
              style: TextStyle(fontSize: 20, color: Colors.purple),
              value: selectedPerson,
              items: generateItems(persons),
              onChanged: (item) {
                setState(() {
                  selectedPerson = item;
                });
              },
            ),
          ),
          Text(
            (selectedPerson != null)
                ? selectedPerson.name
                : "Belum ada yang terpilih",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class Person {
  Person(this.name);

  String name;
}
