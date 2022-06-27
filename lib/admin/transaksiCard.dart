import 'package:e19_meongguk/admin/editBarang.dart';
import 'package:e19_meongguk/constans.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransaksiCard extends StatelessWidget {
  final String namaPemesan;
  final String Alamat;
  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  const TransaksiCard(this.namaPemesan, this.Alamat,
      {this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color.fromARGB(255, 68, 84, 109))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 60,
            margin: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.shopping_basket,
              color: palette.bg1,
              size: 50.0,
            ),
          ),
          Container(
            width: 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(namaPemesan,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 14)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(Alamat,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal, fontSize: 10)),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            height: 100,
            width: 50,
            margin: EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 40,
                  width: 50,
                  child: RaisedButton(
                      shape: CircleBorder(),
                      color: Colors.red[900],
                      child: Center(
                          child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 20,
                      )),
                      onPressed: () {
                        if (onDelete != null) onDelete!();
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
