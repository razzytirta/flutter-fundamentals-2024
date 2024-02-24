import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String? id;
  String? name;
  String? job;
  String? created;

  PostResult({this.id, this.name, this.job, this.created});

  factory PostResult.fromJson(Map<String, dynamic> json) {
    return PostResult(
      id: json["id"],
      name: json["name"],
      job: json["job"],
      created: json["createdAt"],
    );
  }

  static Future<PostResult> connectToAPI(String name, String job) async {
    String apiURL = "https://reqres.in/api/users";

    var response = await http.post(
      Uri.parse(apiURL),
      body: {
        "name": name,
        "job": job,
      },
    );

    var jsonObject = json.decode(response.body);

    return PostResult.fromJson(jsonObject);
  }
}
