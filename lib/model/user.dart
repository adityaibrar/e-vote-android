class User {
  String? idUser;
  String? nama;
  String? username;
  String? password;
  String? akses;
  String? joiningDate;

  User(
      {this.idUser,
      this.nama,
      this.username,
      this.password,
      this.akses,
      this.joiningDate});

  User.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    nama = json['nama'];
    username = json['username'];
    password = json['password'];
    akses = json['akses'];
    joiningDate = json['joining_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_user'] = this.idUser;
    data['nama'] = this.nama;
    data['username'] = this.username;
    data['password'] = this.password;
    data['akses'] = this.akses;
    data['joining_date'] = this.joiningDate;
    return data;
  }
}

class GetArg {
  final String? id;
  final String? nama;

  GetArg(this.id, this.nama);
}
