import 'package:flutter_api/model/user_name.dart';
import 'package:flutter_api/model/user_photo.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final Photo picture;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.picture,
  });
}
