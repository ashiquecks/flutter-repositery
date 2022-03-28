import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:msstepper_widget/user.dart';
import 'User.dart';

class Services {
  var url = Uri.parse("https://jsonplaceholder.typicode.com/users");

  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<User> list = parseUsers(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<User> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }
}
