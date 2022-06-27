import 'package:e19_meongguk/constans.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: palette.bg1,
        centerTitle: true,
        title: Text(
          'Favorite',
          style: TextStyle(
            color: palette.orange,
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: const Text(
          'FavoritePage',
        ),
      ),
    );
  }
}
