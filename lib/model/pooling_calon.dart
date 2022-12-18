import 'dart:convert';

Candidate candidateFromJson(String str) => Candidate.fromJson(json.decode(str));

String candidateToJson(Candidate data) => json.encode(data.toJson());

class Candidate {
  Candidate({
    required this.dataCalon,
  });

  List<DataCalon> dataCalon;

  factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        dataCalon: List<DataCalon>.from(
            json["data_calon"].map((x) => DataCalon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data_calon": List<dynamic>.from(dataCalon.map((x) => x.toJson())),
      };
}

class DataCalon {
  DataCalon({
    required this.namaCalon,
    required this.jumlahVote,
  });

  final String namaCalon;
  final double jumlahVote;

  factory DataCalon.fromJson(Map<String, dynamic> json) => DataCalon(
        namaCalon: json["nama_calon"],
        jumlahVote: json["jumlah_vote"],
      );

  Map<String, dynamic> toJson() => {
        "nama_calon": namaCalon,
        "jumlah_vote": jumlahVote,
      };
}
