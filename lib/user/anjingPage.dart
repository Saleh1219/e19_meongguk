import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e19_meongguk/AnjingProduct/bravecto.dart';
import 'package:e19_meongguk/AnjingProduct/happydog.dart';
import 'package:e19_meongguk/admin/ItemCard.dart';
import 'package:e19_meongguk/admin/mainAdmin.dart';
import 'package:e19_meongguk/constans.dart';
import 'package:e19_meongguk/user/barangCard.dart';
import 'package:flutter/material.dart';

class AnjingPage extends StatefulWidget {
  @override
  State<AnjingPage> createState() => _AnjingPageState();
}

class _AnjingPageState extends State<AnjingPage> {
  // String namaProduk = "",
  //     keteranganProduk = "",
  //     hargaProduk = "",
  //     deskripsiProduk = "",
  //     tipeProduk = "";
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference barang = firestore.collection('barang');
    return Scaffold(
      backgroundColor: palette.bg4,
      body: ListView(
        // crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        // crossAxisCount: 2,
        children: <Widget>[
          FutureBuilder<QuerySnapshot>(
            future: barang.where('tipeProduk', isEqualTo: 'Anjing').get(),
            builder: (_, snapshot) {
              return (snapshot.hasData)
                  ? Column(
                      children: snapshot.data!.docs
                          .map(
                            (e) => BarangCard(
                              e.get('namaProduk'),
                              e.get('keteranganProduk'),
                              e.get('hargaProduk'),
                              e.get('deskripsiProduk'),
                              e.get('tipeProduk'),
                              e.get('foto'),
                            ),
                          )
                          .toList(),
                    )
                  : Text('Loading...');
            },
          ),
        ],
      ),
    );
  }
}
