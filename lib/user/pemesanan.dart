import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e19_meongguk/constans.dart';
import 'package:e19_meongguk/counter_controller.dart';
import 'package:e19_meongguk/user/detailPage.dart';
import 'package:e19_meongguk/user/landingpage.dart';
import 'package:e19_meongguk/user/pemesanan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class PesanPage extends StatelessWidget {
  // final String id;
  final String namaProduk;
  final String keteranganProduk;
  final int hargaProduk;
  final String deskripsiProduk;
  final String tipeProduk;
  final String fotoProduk;
  // final String namaPemesan;
  // final String alamatPemesan;
  // final String Keterangan;

  final namaPemesanCtrl = TextEditingController();
  final alamatPemesanCtrl = TextEditingController();
  final KeteranganCtrl = TextEditingController();

  PesanPage(this.namaProduk, this.keteranganProduk, this.hargaProduk,
      this.deskripsiProduk, this.tipeProduk, this.fotoProduk,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterController cCount = Get.put(CounterController());
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference akun = firestore.collection('Pesanan');
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "PEMESANAN",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            color: palette.bg4,
          ),
        ),
        backgroundColor: palette.bg1,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: palette.bg4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    child: Image.network(
                      "$fotoProduk",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          // width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            namaProduk,
                            style: GoogleFonts.poppins(fontSize: 18),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Text(
                          "Rp$hargaProduk",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 20),
              child: TextField(
                controller: namaPemesanCtrl,
                decoration: InputDecoration(
                  hintText: "Masukkan Nama",
                  labelText: "Nama Pemesan",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lime,
                    ),
                  ),
                  icon: Icon(
                    Icons.person,
                    color: palette.bg1,
                    size: 25.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: TextFormField(
                controller: alamatPemesanCtrl,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Masukkan Alamat",
                  labelText: "Alamat Pemesan",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lime,
                    ),
                  ),
                  icon: Icon(
                    Icons.location_pin,
                    color: palette.bg1,
                    size: 25.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: TextFormField(
                controller: KeteranganCtrl,
                decoration: InputDecoration(
                  hintText: "Masukkan Keterangan Produk",
                  labelText: "Keterangan (opsional)",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lime,
                    ),
                  ),
                  icon: Icon(
                    Icons.comment,
                    color: palette.bg1,
                    size: 25.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 40,
              width: lebar,
              child: Container(
                child: ElevatedButton(
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              "Data Telah Tersimpan",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            actions: [
                              Align(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  onPressed: () {
                                    akun.add({
                                      'nama': namaPemesanCtrl.text,
                                      'alamat': alamatPemesanCtrl.text,
                                      'keterangan': KeteranganCtrl.text,
                                    });
                                    namaPemesanCtrl.text = "";
                                    alamatPemesanCtrl.text = "";
                                    KeteranganCtrl.text = "";

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LandingPage()),
                                    );
                                  },
                                  child: Text(
                                    "OK",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff354259),
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(30),
                    // ),
                  ),
                  child: const Center(
                    child: Text("PESAN"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
