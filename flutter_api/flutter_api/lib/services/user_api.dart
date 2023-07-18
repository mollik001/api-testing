import 'package:flutter_api/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_api/model/user_name.dart';
import 'package:flutter_api/model/user_photo.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );

      final picture = Photo(
        thumbnail: e['picture']['thumbnail'],
        medium: e['picture']['medium'],
        large: e['picture']['large'],
      );

      return User(
        cell: e['cell'],
        email: e['email'],
        gender: e['gender'],
        nat: e['nat'],
        phone: e['phone'],
        name: name,
        picture: picture,
      );
    }).toList();

    return users;
  }
}
