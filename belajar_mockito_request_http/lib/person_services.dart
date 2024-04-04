import 'dart:convert';

import 'package:belajar_mockito_request_http/person.dart';
import 'package:http/http.dart' as http;

class PersonServices {
  static Future<Person> getPersonById(String id, http.Client client) async {
    String url = ".../persons/" + id;

    var response = await client.get(url);
    if (response.statusCode != 200) {
      throw Exception("Error");
    }
    var result = json.decode(response.body);

    return Person.fromJson(result);
  }
}
