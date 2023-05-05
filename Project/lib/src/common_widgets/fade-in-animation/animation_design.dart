import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/strings.dart';
import 'fadeInAnimationModel.dart';
import 'fadeinAnimationController.dart';

class rFadeInAnimation extends StatelessWidget {
  rFadeInAnimation({
    super.key,
    this.animationPos,
    required this.durationMsec,
    required this.child,
  });

  final controller = Get.put(fadeinAnimationController());
  final int durationMsec;
  final Widget child;
  final rAnimatePosition? animationPos;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        top: controller.animate.value
            ? animationPos!.topAfter
            : animationPos!.topBefore,
        left: controller.animate.value
            ? animationPos!.leftAfter
            : animationPos!.leftBefore,
        right: controller.animate.value
            ? animationPos!.rightAfter
            : animationPos!.rightBefore,
        bottom: controller.animate.value
            ? animationPos!.bottomAfter
            : animationPos!.bottomBefore,
        duration: Duration(milliseconds: durationMsec),
        child: AnimatedOpacity(
          opacity: controller.animate.value ? 1.0 : 0.0,
          duration: Duration(milliseconds: durationMsec),
          child: child,
        ),
      ),
    );
  }
}
