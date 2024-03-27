import 'package:belajar_hive_database/main_page.dart';
import 'package:belajar_hive_database/model/monster.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDocumentDirect = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirect.path);
  Hive.registerAdapter(MonsterAdapter(), 0);
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
