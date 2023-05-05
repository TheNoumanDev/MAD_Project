import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_final_ass/src/features/authentication/screens/login_screen/Signup_screen.dart';
import '../../../../common_widgets/fade-in-animation/fadeinAnimationController.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/strings.dart';
import '../../controllers/splash_screen_controller.dart';
import '../login_screen/login_screen.dart';

class splashScreen extends StatelessWidget {
  splashScreen({super.key});

  /* Variables   */

  final splash_controller = Get.put(splash_screen_controller());

  @override
  Widget build(BuildContext context) {
    splash_controller.start_Animation();
    print("object");
    return Scaffold(
        backgroundColor: const Color.fromRGBO(37, 24, 78, 1),
        body: Stack(
          children: [
            Positioned(
              top: 80,
              left: 110,
              child: AvatarGlow(
                endRadius: 90,
                duration: const Duration(seconds: 2),
                glowColor: Colors.white24,
                repeat: true,
                repeatPauseDuration: const Duration(seconds: 1),
                startDelay: const Duration(seconds: 1),
                child: Material(
                    elevation: 8.0,
                    shape: const CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      radius: 50.0,
                      child: Image.asset(appLogo, fit: BoxFit.fill),
                    )),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                top: 270,
                left: splash_controller.showFirst.value ? 130 : 0,
                duration: const Duration(milliseconds: 1000),
                child: AnimatedOpacity(
                  opacity: splash_controller.showFirst.value ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: const Text(
                    rSplashHeader1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                top: 320,
                left: splash_controller.showSecond.value ? 100 : 0,
                duration: const Duration(milliseconds: 1000),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1000),
                  opacity: splash_controller.showSecond.value ? 1.0 : 0.0,
                  child: const Text(
                    rSplashHeader2,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                top: 450,
                left: splash_controller.showThird.value ? 120 : 0,
                duration: const Duration(milliseconds: 1000),
                child: AnimatedOpacity(
                  opacity: splash_controller.showThird.value ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: const Text(
                    rSplashSubHeader3,
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                top: 480,
                left: splash_controller.showThird.value ? 70 : 0,
                duration: const Duration(milliseconds: 1000),
                child: AnimatedOpacity(
                  opacity: splash_controller.showThird.value ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: const Text(
                    rSplashSubHeader4,
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                top: 600,
                left: splash_controller.showfourth.value ? 60 : 0,
                duration: const Duration(milliseconds: 1000),
                child: AnimatedOpacity(
                  opacity: splash_controller.showfourth.value ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: GestureDetector(
                    child: _animatedButtonUI(rSplashButton4),
                    onTap: () {
                      Get.to(() => SignUp_screen());
                      //Navigator.of(context).pushNamedAndRemoveUntil(
                      //   registerViewRoute, (route) => false);
                    },
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget _animatedButtonUI(String r) => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            r,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(37, 24, 78, 1),
            ),
          ),
        ),
      );
}
