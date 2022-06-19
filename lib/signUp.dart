import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e19_meongguk/signin.dart';
import 'package:e19_meongguk/splashscreen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String nama = "", email = "", noHp = "", password = ""; // kopass="";

  final namaCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final noHpCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final kopassCtrl = TextEditingController();

  PlatformFile? ambilFile;

  Future pilihFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      ambilFile = result.files.first;
    });
  }

  Future unggahFile(ambilFile) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference akun = firestore.collection('akun');
    String url;
    final File imageFile = File(ambilFile!.path);
    String fileName = basename(imageFile.path);
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("foto").child(fileName);
    UploadTask uploadTask = ref.putFile(imageFile);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
    url = await snapshot.ref.getDownloadURL();

    akun.add({
      'nama': namaCtrl.text,
      'email': emailCtrl.text,
      'noHp': noHpCtrl.text,
      'password': passwordCtrl.text,
      'foto': url,
    });
    namaCtrl.text = "";
    emailCtrl.text = "";
    noHpCtrl.text = "";
    passwordCtrl.text = "";
    kopassCtrl.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 50, bottom: 50),
                child: Text(
                  "Sign Up!",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextField(
                  controller: namaCtrl,
                  decoration: InputDecoration(
                    hintText: "Masukkan Nama Anda",
                    labelText: "Nama",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lime,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextField(
                  controller: emailCtrl,
                  decoration: InputDecoration(
                    hintText: "Masukkan Email Anda",
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lime,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: noHpCtrl,
                  decoration: InputDecoration(
                    hintText: "Masukkan No. Handphone Anda",
                    labelText: "No. Handphone",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lime,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextField(
                  obscureText: true,
                  controller: passwordCtrl,
                  decoration: InputDecoration(
                    hintText: "Masukkan Password Anda",
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lime,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextField(
                  obscureText: true,
                  controller: kopassCtrl,
                  decoration: InputDecoration(
                    hintText: "Konfirmasi Password Anda",
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lime,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      margin: EdgeInsets.only(left: 30, bottom: 10),
                      child: ElevatedButton(
                          onPressed: () {
                            pilihFile();
                          },
                          child: Text(
                            "Pilih Foto",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          )),
                    ),
                  ),
                  Text(ambilFile != null ? "${ambilFile!.name}" : ""),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  if (passwordCtrl.text == kopassCtrl.text) {
                    try {
                      unggahFile(ambilFile);
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailCtrl.text,
                              password: passwordCtrl.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SplashScreen()),
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'invalid-email') {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(
                                  "Email yang anda masukkan tidak valid",
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
                                        Navigator.pop(context);
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
                      } else if (e.code == 'email-already-in-use') {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(
                                  "Email yang anda masukkan sudah ada",
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
                                        Navigator.pop(context);
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
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(
                                  "mohon masukkan data lengkap",
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
                                        Navigator.pop(context);
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
                      }
                    }
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              "Konfirmasi Password Salah",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "OK",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        });
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff354259),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Container(
                  height: 40,
                  width: 60,
                  child: const Center(
                    child: Text("Submit"),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 40),
                child: Row(
                  children: [
                    Text(
                      "Sudah memiliki akun?",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return SignInPage();
                            }),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.poppins(),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
