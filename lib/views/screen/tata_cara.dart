import 'package:android_vote/constant/theme_shared.dart';
import 'package:flutter/material.dart';

class Rules extends StatefulWidget {
  const Rules({super.key});

  @override
  State<Rules> createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Text(
                    "Masuk pada aplikasi E-Vote.\nSilahkan login menggunakan akun\nyang telah disediakan admin. dan\n setelah berhasil login cek apakah\nnama yang tampil pada sebelah\npojok kanan sudah sesuai dengan\nama anda.",
                    style: subtittleTextStyle.copyWith(
                        color: blackColor, fontSize: 13),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/tata1.png',
                    height: 240,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/tata2.png',
                    height: 240,
                  ),
                  const Spacer(),
                  Text(
                    "Pilih Menu Vote untuk\nmelaksanakan pemilihan ketua\nOsis\nPastikan anda belum pernah\nmelaksanakan pemilihan\nsebelumnya.",
                    style: subtittleTextStyle.copyWith(
                        color: blackColor, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "Silahkan pilih calon ketua Osis\npilihan anda, Sebelum\nmelaksanakan pemilihan\nketua Osis, silahkan baca\nterlebih dahulu Visi Misi dari\nsetiap calon ketua Osis\ndengan mengklik menu Vote.\nDan lakukan pemilihan nama\ncalon pilihan anda, dan tekan\ntombol Vote bila anda sudah\nyakin dengan pilihan anda.",
                          style: subtittleTextStyle.copyWith(
                              color: blackColor, fontSize: 13),
                        ),
                        Text(
                          "NB:satu akun hanya boleh\nmemilih satu kali saja",
                          style: subtittleTextStyle.copyWith(
                              color: redColor, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/tata3.png',
                    height: 240,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/tata4.png',
                    height: 240,
                  ),
                  const Spacer(),
                  Text(
                    "Jika sudah memilih salah satu\nkandidat, maka tekan pojok kanan\nuntuk log out. Dan akan keluar pop\nup seperti gambar disamping.",
                    style: subtittleTextStyle.copyWith(
                        color: blackColor, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
