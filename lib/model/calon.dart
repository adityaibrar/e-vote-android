// To parse this JSON data, do
//
//     final candidate = candidateFromJson(jsonString);

import 'dart:convert';

List<Candidate> candidateFromJson(String str) => List<Candidate>.from(json.decode(str).map((x) => Candidate.fromJson(x)));

String candidateToJson(List<Candidate> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Candidate {
    Candidate({
        required this.idCalon,
        required this.namaCalon,
        required this.kelas,
        required this.jurusan,
        required this.foto,
        required this.visi,
        required this.misi,
        required this.program,
        required this.ta,
        required this.periode,
        required this.status,
    });

    String idCalon;
    String namaCalon;
    String kelas;
    String jurusan;
    String foto;
    String visi;
    String misi;
    String program;
    String ta;
    String periode;
    String status;

    factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        idCalon: json["id_calon"],
        namaCalon: json["nama_calon"],
        kelas: json["kelas"],
        jurusan: json["jurusan"],
        foto: json["foto"],
        visi: json["visi"],
        misi: json["misi"],
        program: json["program"],
        ta: json["TA"],
        periode: json["periode"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id_calon": idCalon,
        "nama_calon": namaCalon,
        "kelas": kelas,
        "jurusan": jurusan,
        "foto": foto,
        "visi": visi,
        "misi": misi,
        "program": program,
        "TA": ta,
        "periode": periode,
        "status": status,
    };
}
