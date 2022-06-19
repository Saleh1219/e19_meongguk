import 'package:e19_meongguk/admin/editBarang.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {
  final String namaProduk;
  final int hargaProduk;
  final String fotoProduk;
  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  const ItemCard(this.namaProduk, this.hargaProduk, this.fotoProduk,
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
            height: 80,
            width: 80,
            child: Image.network("$fotoProduk"),
          ),
          Container(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(namaProduk,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 16)),
                ),
                Text(
                  "Rp$hargaProduk",
                  style: GoogleFonts.poppins(),
                )
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
                      color: Colors.green[900],
                      child: Center(
                          child: Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                        size: 20,
                      )),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return EditBarangPage();
                          }),
                        );
                        if (onUpdate != null) onUpdate!();
                      }),
                ),
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
