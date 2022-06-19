import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e19_meongguk/constans.dart';
import 'package:e19_meongguk/user/anjing.dart';
import 'package:e19_meongguk/user/kucing.dart';
import 'package:flutter/material.dart';

class BerandaPage extends StatefulWidget {
  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int _activeTabIndex;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_setActiveTabIndex);
  }

  void _setActiveTabIndex() {
    _activeTabIndex = _tabController.index;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference barang = firestore.collection('barang');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/VertikalMeongGuk.png',
          height: 140,
          fit: BoxFit.fitHeight,
        ),
        backgroundColor: palette.bg1,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: palette.orange,
          labelColor: palette.orange,
          unselectedLabelColor: Colors.grey,
          labelPadding: EdgeInsets.all(0),
          tabs: [
            Tab(text: 'ANJING'),
            Tab(text: 'KUCING'),
          ],
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          AnjingPage(),
          KucingPage(),
        ],
      ),
    );
  }
}
