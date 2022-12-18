// To parse this JSON data, do
//
//     final candidate = candidateFromJson(jsonString);

import 'dart:convert';

Candidate candidateFromJson(String str) => Candidate.fromJson(json.decode(str));

String candidateToJson(Candidate data) => json.encode(data.toJson());

class Candidate {
  Candidate({
    required this.code,
    required this.status,
    required this.dataUser,
  });

  int code;
  String status;
  List<DataUser> dataUser;

  factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        code: json["code"],
        status: json["status"],
        dataUser: List<DataUser>.from(
            json["data_user"].map((x) => DataUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data_user": List<dynamic>.from(dataUser.map((x) => x.toJson())),
      };
}

class DataUser {
  DataUser({
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

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
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

class GetArg {
  final String? id;
  final String? nama;

  GetArg(this.id, this.nama);
}
