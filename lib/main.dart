import 'package:e19_meongguk/AnjingProduct/bravecto.dart';
import 'package:e19_meongguk/AnjingProduct/happydog.dart';
import 'package:e19_meongguk/KucingProduct/royalcanin.dart';
import 'package:e19_meongguk/KucingProduct/whiskas.dart';
import 'package:e19_meongguk/admin/addBarang.dart';
import 'package:e19_meongguk/admin/mainAdmin.dart';
import 'package:e19_meongguk/signIn.dart';
import 'package:e19_meongguk/splashscreen.dart';
import 'package:e19_meongguk/user/beranda.dart';
import 'package:e19_meongguk/user/landingpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
