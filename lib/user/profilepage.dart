import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e19_meongguk/constans.dart';
import 'package:e19_meongguk/signIn.dart';
import 'package:e19_meongguk/splashscreen.dart';
import 'package:e19_meongguk/userController.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    userController data = Get.find();
    User? userAuth = FirebaseAuth.instance.currentUser;
    final userController control = Get.put(userController());
    CollectionReference akun = FirebaseFirestore.instance.collection('akun');
    final nama = TextEditingController(text: "${data.nama.value}");
    final email = TextEditingController(text: "${data.email.value}");
    final noHp = TextEditingController(text: "${data.noHp.value}");
    final foto = TextEditingController(text: "${data.foto.value}");
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: palette.bg1,
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: palette.orange,
            ),
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Color(0xffECE5C7),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage("${foto.text}"),
            ),
            Text(
              "${nama.text}",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: palette.bg1,
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
              width: 150.0,
              child: Divider(
                color: palette.bg1,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: palette.bg1,
                ),
                title: Text(
                  "${email.text}",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: palette.bg1,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: palette.bg1,
                ),
                title: Text(
                  "${noHp.text}",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: palette.bg1,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 130,
                height: 50,
                margin: EdgeInsets.only(
                  top: 30,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: palette.bg1,
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 0),
                      child: Icon(
                        Icons.logout,
                        color: palette.orange,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          FirebaseAuth.instance.signOut();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return SignInPage();
                          }));
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 25),
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: palette.orange,
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
      ),
    );
  }
}
