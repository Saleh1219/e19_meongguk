import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var whiskas = 1.obs;

  incrementWhiskas() {
    whiskas.value++;
  }

  decrementWhiskas() {
    if (whiskas.value <= 1) {
      Get.snackbar(
        "Add To Cart",
        "Barang Tidak Bisa Kosong",
        icon: Icon(Icons.alarm),
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 3),
      );
    } else {
      whiskas.value--;
    }
  }
}
