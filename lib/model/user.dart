
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.result,
  });

  Result result;

  factory User.fromJson(Map<String, dynamic> json) => User(
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class Result {
  Result({
    required this.idUser,
    required this.nama,
    required this.username,
    required this.password,
    required this.akses,
    required this.joiningDate,
  });

  String idUser;
  String nama;
  String username;
  String password;
  String akses;
  DateTime joiningDate;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        idUser: json["id_user"],
        nama: json["nama"],
        username: json["username"],
        password: json["password"],
        akses: json["akses"],
        joiningDate: DateTime.parse(json["joining_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "nama": nama,
        "username": username,
        "password": password,
        "akses": akses,
        "joining_date": joiningDate.toIso8601String(),
      };
}
