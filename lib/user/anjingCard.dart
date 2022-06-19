import 'package:e19_meongguk/admin/editBarang.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnjingCard extends StatelessWidget {
  final String namaProduk;
  final int hargaProduk;
  final String fotoProduk;
  final String tipeProduk;
  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  const AnjingCard(
      this.namaProduk, this.hargaProduk, this.fotoProduk, this.tipeProduk,
      {this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      // width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      // padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            child: Image.network("$fotoProduk"),
          ),
          Container(
            width: 100,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    namaProduk,
                    style: GoogleFonts.poppins(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  "Rp$hargaProduk",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
