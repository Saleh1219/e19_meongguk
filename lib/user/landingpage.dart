import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e19_meongguk/constans.dart';
import 'package:e19_meongguk/user/beranda.dart';
import 'package:e19_meongguk/user/favoritepage.dart';
import 'package:e19_meongguk/user/keranjangpage.dart';
import 'package:e19_meongguk/user/profilepage.dart';
import 'package:e19_meongguk/userController.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:e19_meongguk/user/launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [
    new BerandaPage(),
    // new FavoritePage(),
    // new KeranjangPage(),
    new ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    User? userAuth = FirebaseAuth.instance.currentUser;
    final userController control = Get.put(userController());
    CollectionReference akun = FirebaseFirestore.instance.collection('akun');
    return Scaffold(
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: palette.bg1,
        type: BottomNavigationBarType.fixed,
        onTap: (index) async {
          final data =
              await akun.where("email", isEqualTo: "${userAuth?.email}").get();

          data.docs.forEach((element) {
            control.id.value = element.id;
            control.nama.value = element.get("nama");
            control.email.value = element.get("email");
            control.noHp.value = element.get("noHp");
            control.foto.value = element.get("foto");
          });
          setState(() {
            _bottomNavCurrentIndex = index;
          });
        },
        currentIndex: _bottomNavCurrentIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.home,
              color: palette.bg1,
            ),
            icon: new Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: 'Beranda',
          ),
          // BottomNavigationBarItem(
          //   activeIcon: new Icon(
          //     Icons.favorite,
          //     color: palette.bg1,
          //   ),
          //   icon: new Icon(
          //     Icons.favorite_border,
          //     color: Colors.grey,
          //   ),
          //   label: 'Favorite',
          // ),
          // BottomNavigationBarItem(
          //   activeIcon: new Icon(
          //     Icons.shopping_cart,
          //     color: palette.bg1,
          //   ),
          //   icon: new Icon(
          //     Icons.shopping_cart,
          //     color: Colors.grey,
          //   ),
          //   label: 'Keranjang',
          // ),
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.person,
              color: palette.bg1,
            ),
            icon: new Icon(
              Icons.person_outline,
              color: Colors.grey,
            ),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
