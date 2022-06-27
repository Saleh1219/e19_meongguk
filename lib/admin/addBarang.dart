import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:e19_meongguk/admin/mainAdmin.dart';
import 'package:e19_meongguk/constans.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class AddBarangPage extends StatefulWidget {
  const AddBarangPage({Key? key}) : super(key: key);

  @override
  State<AddBarangPage> createState() => _DetailBarangPageState();
}

class _DetailBarangPageState extends State<AddBarangPage> {
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

  PlatformFile? ambilFile;

  Future hapusValue() async {
    namaProCtrl.text = "";
    KetProCtrl.text = "";
    HargaProCtrl.text = "";
    DeskripsiCtrl.text = "";
    TipeCtrl.text = "";
    // ambilFile. = "";
  }

  Future pilihFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      ambilFile = result.files.first;
    });
  }

  Future unggahFile(ambilFile) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference barang = firestore.collection('barang');
    String url;
    final File imageFile = File(ambilFile!.path);
    String fileName = basename(imageFile.path);
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("foto").child(fileName);
    UploadTask uploadTask = ref.putFile(imageFile);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
    url = await snapshot.ref.getDownloadURL();

    barang.add({
      'namaProduk': namaProCtrl.text,
      'keteranganProduk': KetProCtrl.text,
      'hargaProduk': int.tryParse(HargaProCtrl.text) ?? 0,
      'deskripsiProduk': DeskripsiCtrl.text,
      'tipeProduk': TipeCtrl.text,
      'foto': url,
    });

    namaProCtrl.text = "";
    KetProCtrl.text = "";
    HargaProCtrl.text = "";
    DeskripsiCtrl.text = "";
    TipeCtrl.text = selectedType.toString();
    // hapusValue();
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference barang = firestore.collection('barang');
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          width: 50,
          height: 50,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(25),
          //   color: Color.fromARGB(61, 0, 0, 0),
          // ),
          child: IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return AdminMainPage();
                }),
              );
            },
          ),
        ),
        centerTitle: true,
        title: Text(
          "TAMBAH DATA",
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
              Container(
                margin:
                    EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
                child: TextField(
                  controller: namaProCtrl,
                  decoration: InputDecoration(
                    hintText: "Masukkan Nama Produk",
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lime,
                      ),
                    ),
                    icon: Icon(
                      Icons.enhanced_encryption,
                      color: palette.bg1,
                      size: 25.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextFormField(
                  controller: KetProCtrl,
                  decoration: InputDecoration(
                    hintText: "Masukkan Keterangan Produk",
                    labelText: "Keterangan",
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
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextField(
                  controller: HargaProCtrl,
                  decoration: InputDecoration(
                    hintText: "Masukkan Harga Produk",
                    labelText: "Harga",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lime,
                      ),
                    ),
                    icon: Icon(
                      Icons.attach_money,
                      color: palette.bg1,
                      size: 25.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextFormField(
                  controller: DeskripsiCtrl,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Masukkan Deskripsi Produk",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lime,
                      ),
                    ),
                    icon: Icon(
                      Icons.subject,
                      color: palette.bg1,
                      size: 25.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                width: lebar,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.pets,
                        color: palette.bg1,
                        size: 25.0,
                      ),
                    ),
                    DropdownButton(
                      itemHeight: 60,
                      items: _produkType
                          .map(
                            (value) => DropdownMenuItem(
                              child: Text(
                                value,
                                style: TextStyle(color: palette.bg1),
                              ),
                              value: value,
                            ),
                          )
                          .toList(),
                      onChanged: (selectedProdukType) {
                        setState(() {
                          selectedType = selectedProdukType;
                        });
                      },
                      value: selectedType,
                      hint: Text("Pilih Tipe Hewan"),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                width: lebar,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.image,
                        color: palette.bg1,
                        size: 25.0,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // margin: EdgeInsets.only(left: 10, right: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              pilihFile();
                            },
                            child: Text("Pilih Foto"),
                          ),
                        ),
                        Container(
                          width: 250,
                          child: Text(
                              ambilFile != null ? "${ambilFile!.name}" : ""),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(30),
                height: 40,
                width: lebar,
                child: Container(
                  child: ElevatedButton(
                    onPressed: () async {
                      unggahFile(ambilFile);

                      // CoolAlert.show(
                      //   context: context,
                      //   type: CoolAlertType.success,
                      //   text: "Data Berhasil Ditambahkan!",
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return AddBarangPage();
                        }),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff354259),
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(30),
                      // ),
                    ),
                    child: const Center(
                      child: Text("SUBMIT"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
