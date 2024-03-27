import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory User.createUser(Map<String, dynamic> json) {
    return User(
      id: json["id"].toString(),
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      avatar: json["avatar"],
    );
  }

  static Future<User> getUserFromAPI(int id) async {
    String apiURL = "https://reqres.in/api/users/" + id.toString();

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)["data"];

    return User.createUser(userData);
  }
}

class UninitializedUser extends User {}
