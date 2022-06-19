import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e19_meongguk/admin/ItemCard.dart';
import 'package:e19_meongguk/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ListBarangPage extends StatefulWidget {
  const ListBarangPage({Key? key}) : super(key: key);

  @override
  State<ListBarangPage> createState() => _ListBarangPageState();
}

class _ListBarangPageState extends State<ListBarangPage> {
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

  final namaProCtrl = TextEditingController();
  final KetProCtrl = TextEditingController();
  final HargaProCtrl = TextEditingController();
  final DeskripsiCtrl = TextEditingController();
  final TipeCtrl = TextEditingController();
  final fotoCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference barang = firestore.collection('barang');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "LIST DATA",
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
                stream: barang.snapshots(),
                builder: (_, snapshot) {
                  return (snapshot.hasData)
                      ? Column(
                          children: snapshot.data!.docs
                              .map(
                                (e) => ItemCard(
                                  e.get('namaProduk'),
                                  e.get('hargaProduk'),
                                  e.get('foto'),
                                  onUpdate: () {
                                    barang.doc(e.id).update({
                                      'namaProduk': namaProCtrl.text,
                                      'hargaProduk':
                                          int.tryParse(HargaProCtrl.text) ?? 0,
                                    });
                                    namaProCtrl.text = "";
                                    HargaProCtrl.text = "";
                                  },
                                  onDelete: () {
                                    barang.doc(e.id).delete();
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
