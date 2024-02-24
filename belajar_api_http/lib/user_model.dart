import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String? id;
  String? name;

  User({this.id, this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      name: json['first_name'] + " " + json['last_name'],
    );
  }

  static Future<User> connectToAPI(String id) async {
    String apiURL = "https://reqres.in/api/users/$id";

    var response = await http.get(Uri.parse(apiURL));

    var jsonObject = json.decode(response.body);

    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.fromJson(userData);
  }

  static Future<List<User>> getAllUsers(String page) async {
    String apiURL = "https://reqres.in/api/users?page=$page";

    var response = await http.get(Uri.parse(apiURL));

    var jsonObject = json.decode(response.body);

    List<dynamic> listUser = (jsonObject as Map<String, dynamic>)['data'];

    List<User> users = [];
    for (int i = 0; i < listUser.length; i++)
      users.add(User.fromJson(listUser[i]));

    return users;
  }
}
