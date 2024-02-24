import 'package:belajar_api_http/post_result_model.dart';
import 'package:belajar_api_http/user_model.dart';
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
  PostResult? postResult;
  User? user;
  String? output = "tidak ada";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "API DEMO",
          ),
          backgroundColor: Colors.black12,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MainPost(postResult: postResult),
              MainGet(user: user),
              MainGetAll(output: output!),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      PostResult.connectToAPI("Mamat", "IT").then((value) {
                        postResult = value;
                        setState(() {});
                      });
                    },
                    child: Text("POST"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      User.connectToAPI("3").then((value) {
                        user = value;
                        setState(() {});
                      });
                    },
                    child: Text("GET"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      User.getAllUsers("2").then((user) {
                        output = "";
                        for (int i = 0; i < user.length; i++) {
                          output = "$output${i + 1}.${user[i].name}, ";
                        }
                        setState(() {});
                      });
                    },
                    child: Text("GET ALL"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MainPost extends StatelessWidget {
  const MainPost({
    super.key,
    required this.postResult,
  });

  final PostResult? postResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      color: Colors.black12,
      child: Center(
        child: Text(
            "${postResult != null ? "id: ${postResult!.id}, " "name: ${postResult!.name}, " "job: ${postResult!.job}, " "createdAt: ${postResult!.created} " : "Data Tidak Ada"}"),
      ),
    );
  }
}

class MainGet extends StatelessWidget {
  const MainGet({
    super.key,
    required this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      color: Colors.black12,
      child: Center(
        child: Text(
            "${user != null ? "id: ${user!.id}, " "name: ${user!.name}, " : "Data Tidak Ada"}"),
      ),
    );
  }
}

// ignore: must_be_immutable
class MainGetAll extends StatelessWidget {
  MainGetAll({
    super.key,
    required this.output,
  });

  String? output = "Tidak ada data";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      color: Colors.black12,
      child: Center(
        child: Text(output!),
      ),
    );
  }
}
