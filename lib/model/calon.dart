import 'dart:convert';

Candidate candidateFromJson(String str) => Candidate.fromJson(json.decode(str));

String candidateToJson(Candidate data) => json.encode(data.toJson());

class Candidate {
    Candidate({
        required this.dataCalon,
    });

    List<DataCalon> dataCalon;

    factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        dataCalon: List<DataCalon>.from(json["data_calon"].map((x) => DataCalon.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data_calon": List<dynamic>.from(dataCalon.map((x) => x.toJson())),
    };
}

class DataCalon {
    DataCalon({
        required this.idCalon,
        required this.namaCalon,
        required this.visimisi,
        required this.gambar,
        required this.jumlahVote,
    });

    String idCalon;
    String namaCalon;
    String visimisi;
    String gambar;
    String jumlahVote;

    factory DataCalon.fromJson(Map<String, dynamic> json) => DataCalon(
        idCalon: json["id_calon"],
        namaCalon: json["nama_calon"],
        visimisi: json["visimisi"],
        gambar: json["gambar"],
        jumlahVote: json["jumlah_vote"],
    );

    Map<String, dynamic> toJson() => {
        "id_calon": idCalon,
        "nama_calon": namaCalon,
        "visimisi": visimisi,
        "gambar": gambar,
        "jumlah_vote": jumlahVote,
    };
}
