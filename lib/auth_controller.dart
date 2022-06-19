import 'package:e19_meongguk/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  String email = "", noHp = "", password = ""; // kopass="";

  final emailCtrl = TextEditingController();
  final noHpCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  // final kopassCtrl = TextEditingController();

  Stream<User?> get streamAuthStatus {
    return auth.authStateChanges();
  }

  void register(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'User Sudah Ada') {
        Get.defaultDialog(
          title: 'Error',
        );
        print('user Sudah Ada');
      } else if (e.code == 'wrong-password') {
        print('Gagal membuat Akun');
      }
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user Tidak Ada') {
      } else if (e.code == 'wrong-password') {
        print('User Tidak Ada');
        Get.defaultDialog(
          title: "Error",
          middleText: 'password Salah Silahkan Masukan Ulang',
        );
      }
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
