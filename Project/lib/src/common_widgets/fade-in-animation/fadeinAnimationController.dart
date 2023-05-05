import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class fadeinAnimationController extends GetxController {
//   static fadeinAnimationController get find => Get.find();

//   RxBool animate = false.obs;

//   Future start_Animation() async {
//     Future.delayed(const Duration(milliseconds: 1500), () {
//       animate.value = true;
//     });

//   }
// }

class fadeinAnimationController extends GetxController {
  static fadeinAnimationController get find => Get.find();

  RxBool animate = false.obs;
  RxBool showFirst = false.obs;
  RxBool showSecond = false.obs;
  RxBool showThird = false.obs;
  RxBool showfourth = false.obs;

  Future start_animation() async {
    Future.delayed(const Duration(milliseconds: 1500), () {
      animate.value = true;
    });
  }

  Future start_Splash_Animation() async {
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
