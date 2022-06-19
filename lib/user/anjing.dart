import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e19_meongguk/AnjingProduct/bravecto.dart';
import 'package:e19_meongguk/AnjingProduct/happydog.dart';
import 'package:e19_meongguk/admin/ItemCard.dart';
import 'package:e19_meongguk/admin/mainAdmin.dart';
import 'package:e19_meongguk/user/anjingCard.dart';
import 'package:flutter/material.dart';

class AnjingPage extends StatefulWidget {
  @override
  State<AnjingPage> createState() => _AnjingPageState();
}

class _AnjingPageState extends State<AnjingPage> {
  String namaProduk = "",
      keteranganProduk = "",
      hargaProduk = "",
      deskripsiProduk = "",
      tipeProduk = "";
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference barang = firestore.collection('barang');
    return Scaffold(
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: <Widget>[
          // Column(
          //   // crossAxisCount: 2,
          //   children: [
          //     StreamBuilder<QuerySnapshot>(
          //       stream: barang.snapshots(),
          //       builder: (_, snapshot) {
          //         return (snapshot.hasData)
          //             ? GridView(
          //                 gridDelegate:
          //                     SliverGridDelegateWithFixedCrossAxisCount(
          //                   crossAxisCount: 2,
          //                 ),
          //                 children: snapshot.data!.docs
          //                     .map(
          //                       (e) => AnjingCard(
          //                           e.get('namaProduk'),
          //                           e.get('hargaProduk'),
          //                           e.get('foto'),
          //                           e.get('tipeProduk')),
          //                     )
          //                     .toList(),
          //               )
          //             : Text('Loading...');
          //       },
          //     ),
          //   ],
          // ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return AnjingBravecto();
                  }),
                );
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/anjingBravecto.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Text('Bravecto Chewable', style: TextStyle(fontSize: 12.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return AdminMainPage();
                  }),
                );
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/anjingSmartHeart.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Text('SmartHart', style: TextStyle(fontSize: 12.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/anjingProPlant.png"),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    Text('Pro Plant', style: TextStyle(fontSize: 12.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/automaticpetfeeder.png"),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    Text(
                      'Automatic Pet Feeder',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/anjingSureGrow.png"),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    Text('Sure Grow 100', style: TextStyle(fontSize: 12.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/anjingTempatTidur.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Text('Tempat Tidur', style: TextStyle(fontSize: 12.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/anjingMonello.png"),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    Text('Monello', style: TextStyle(fontSize: 12.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/anjingKalung.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Text('Tempat Tidur', style: TextStyle(fontSize: 12.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/petcarrier.png"),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    Text('Pet Carrier', style: TextStyle(fontSize: 12.0)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
