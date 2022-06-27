import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e19_meongguk/admin/ItemCard.dart';
import 'package:e19_meongguk/admin/transaksiCard.dart';
import 'package:e19_meongguk/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class RiwayatPemesanan extends StatefulWidget {
  const RiwayatPemesanan({Key? key}) : super(key: key);

  @override
  State<RiwayatPemesanan> createState() => _RiwayatPemesananState();
}

class _RiwayatPemesananState extends State<RiwayatPemesanan> {
  String namaProduk = "",
      keteranganProduk = "",
      hargaProduk = "",
      deskripsiProduk = "",
      tipeProduk = "";

  List<String> _produkType = <String>[
    'Anjing',
    'Kucing',
  ];
  var selectedType;

  final namaPemesanan = TextEditingController();
  final Alamat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference Pesanan = firestore.collection('Pesanan');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "LIST PEMESANAN",
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
      body: ListView(
        children: [
          Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: Pesanan.snapshots(),
                builder: (_, snapshot) {
                  return (snapshot.hasData)
                      ? Column(
                          children: snapshot.data!.docs
                              .map(
                                (e) => TransaksiCard(
                                  e.get('nama'),
                                  e.get('alamat'),
                                  onUpdate: () {},
                                  onDelete: () {
                                    Pesanan.doc(e.id).delete();
                                  },
                                ),
                              )
                              .toList(),
                        )
                      : Text('Loading...');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
