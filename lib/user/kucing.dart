import 'package:e19_meongguk/KucingProduct/royalcanin.dart';
import 'package:e19_meongguk/KucingProduct/whiskas.dart';
import 'package:flutter/material.dart';

class KucingPage extends StatefulWidget {
  @override
  State<KucingPage> createState() => _KucingPageState();
}

class _KucingPageState extends State<KucingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return kucingWhiskas();
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
                          image: AssetImage("assets/kucingWhiskas.png"),
                          // fit: BoxFit.fitHeight),
                        ),
                      ),
                    ),
                    // Icon(
                    //   Icons.home,
                    //   size: 70,
                    //   color: Colors.blueAccent,
                    // ),
                    Text('Whiskas', style: TextStyle(fontSize: 12.0)),
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
                    return KucingRoyalCanin();
                  }),
                );
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //Icon(Icons.home, size: 70, color: Colors.blueAccent,),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/kucingRoyalCanin.png"),
                          // fit: BoxFit.fitHeight),
                        ),
                      ),
                    ),
                    Text('Royal Canin', style: TextStyle(fontSize: 12.0)),
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
                            image: AssetImage("assets/kucingLitterBox.png"),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    Text(
                      'Litter Box',
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return KucingRoyalCanin();
                  }),
                );
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //Icon(Icons.home, size: 70, color: Colors.blueAccent,),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/petcarrier.png"),
                          // fit: BoxFit.fitHeight),
                        ),
                      ),
                    ),
                    Text('Pet Carrier', style: TextStyle(fontSize: 12.0)),
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
                            image: AssetImage("assets/kucingKitCat.png"),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    Text(
                      'Kit Cat Breath Bites',
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return KucingRoyalCanin();
                  }),
                );
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //Icon(Icons.home, size: 70, color: Colors.blueAccent,),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/kucingFungizol.png"),
                          // fit: BoxFit.fitHeight),
                        ),
                      ),
                    ),
                    Text('Fungizol', style: TextStyle(fontSize: 12.0)),
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
                            image: AssetImage("assets/kucingSnappyTom.png"),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    Text(
                      'Snappy Tom',
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return KucingRoyalCanin();
                  }),
                );
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //Icon(Icons.home, size: 70, color: Colors.blueAccent,),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/kucingRoyalCanin.png"),
                          // fit: BoxFit.fitHeight),
                        ),
                      ),
                    ),
                    Text('Royal Canin', style: TextStyle(fontSize: 12.0)),
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
                            image: AssetImage("assets/kucingMeO.png"),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    Text(
                      'Me-O Creamy Treats',
                      style: TextStyle(fontSize: 12.0),
                    ),
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
