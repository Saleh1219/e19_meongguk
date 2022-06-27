import 'dart:io';

import 'package:e19_meongguk/constans.dart';
import 'package:e19_meongguk/counter_controller.dart';
import 'package:e19_meongguk/user/pemesanan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatelessWidget {
  // final String id;
  final String namaProduk;
  final String keteranganProduk;
  final int hargaProduk;
  final String deskripsiProduk;
  final String tipeProduk;
  final String fotoProduk;

  DetailPage(this.namaProduk, this.keteranganProduk, this.hargaProduk,
      this.deskripsiProduk, this.tipeProduk, this.fotoProduk,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterController cCount = Get.put(CounterController());
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Container(
        child: Stack(
          children: [
            Container(
              height: 370,
              width: lebar,
              decoration: BoxDecoration(
                color: palette.bg4,
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(30),
                //   bottomRight: Radius.circular(30),
                // ),
              ),
              child: Container(
                margin:
                    EdgeInsets.only(top: 50, bottom: 50, left: 20, right: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("$fotoProduk"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            ListView(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.only(top: 310),
                        height: tinggi,
                        width: lebar,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 20,
                                right: 20,
                              ),
                              child: Text(
                                "$namaProduk",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: Text(
                                "$keteranganProduk",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    // fontWeight: FontWeight.,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: lebar,
                              padding: const EdgeInsets.only(
                                left: 20,
                                top: 10,
                                right: 20,
                                bottom: 10,
                              ),
                              child: Text(
                                "Rp$hargaProduk",
                                style: GoogleFonts.firaSans(
                                  textStyle: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                              width: lebar,
                              child: const DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 223, 223, 223)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                top: 20,
                              ),
                              child: Text(
                                "DETAIL : ",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff354259),
                                  ),
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: ReadMoreText(
                                  "$deskripsiProduk",
                                  trimLines: 5,
                                  textAlign: TextAlign.justify,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: "\nShow More",
                                  trimExpandedText: "\nShow Less",
                                  lessStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff354259).withOpacity(0.5),
                                  ),
                                  moreStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff354259).withOpacity(0.5),
                                  ),
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SafeArea(
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(61, 0, 0, 0),
                ),
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_left),
                  iconSize: 30,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
