import 'package:e19_meongguk/constans.dart';
import 'package:flutter/material.dart';

class KeranjangPage extends StatefulWidget {
  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: palette.bg1,
        centerTitle: true,
        title: Text(
          'Keranjang',
          style: TextStyle(
            color: palette.orange,
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: const Text(
          'KeranjangPage',
        ),
      ),
    );
  }
}
