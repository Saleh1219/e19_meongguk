import 'package:e19_meongguk/admin/editBarang.dart';
import 'package:e19_meongguk/user/detailPage.dart';
import 'package:e19_meongguk/user/pemesanan.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BarangCard extends StatelessWidget {
  final String namaProduk;
  final String keteranganProduk;
  final int hargaProduk;
  final String deskripsiProduk;
  final String tipeProduk;
  final String fotoProduk;
  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  const BarangCard(this.namaProduk, this.keteranganProduk, this.hargaProduk,
      this.deskripsiProduk, this.tipeProduk, this.fotoProduk,
      {this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Container(
      height: 120,
      width: lebar,
      // color: Colors.white,
      // width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.only(left: 5, right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),

      // padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            child: Image.network(
              "$fotoProduk",
              fit: BoxFit.contain,
            ),
          ),
          Container(
            height: 100,
            width: 200,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 20,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      namaProduk,
                                      keteranganProduk,
                                      hargaProduk,
                                      deskripsiProduk,
                                      tipeProduk,
                                      fotoProduk)));
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff354259)),
                        ),
                        child: Text(
                          "Detail".toUpperCase(),
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 20,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PesanPage(
                                      namaProduk,
                                      keteranganProduk,
                                      hargaProduk,
                                      deskripsiProduk,
                                      tipeProduk,
                                      fotoProduk)));
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff354259)),
                        ),
                        child: Text(
                          "Pesan".toUpperCase(),
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
