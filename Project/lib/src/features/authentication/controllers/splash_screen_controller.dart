import 'package:flutter/material.dart';
import 'package:get/get.dart';

class splash_screen_controller extends GetxController {
  static splash_screen_controller get find => Get.find();

  RxBool showFirst = false.obs;
  RxBool showSecond = false.obs;
  RxBool showThird = false.obs;
  RxBool showfourth = false.obs;

  Future start_Animation() async {
    Future.delayed(const Duration(milliseconds: 1500), () {
      showFirst.value = true;
    });
    Future.delayed(const Duration(milliseconds: 2500), () {
      showSecond.value = true;
    });
    Future.delayed(const Duration(milliseconds: 3500), () {
      showThird.value = true;
    });
    Future.delayed(const Duration(milliseconds: 4500), () {
      showfourth.value = true;
    });
  }
}
