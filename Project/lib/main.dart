import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mad_final_ass/src/features/Mainfile/screens/task8/db/sql_helper.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:mad_final_ass/src/features/Mainfile/screens/profileScreen.dart';
import 'package:mad_final_ass/src/features/authentication/screens/splash_screen/splash_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sql_helper.initDb();
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notification',
          channelDescription: 'Notification channel for basic tests')
    ],
    debug: true,
  );
  runApp(
    GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: Initializer(),
    ),
  );
}

class Initializer extends StatelessWidget {
  const Initializer({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final currentUser = FirebaseAuth.instance.currentUser;
            if (currentUser == null) {
              return splashScreen();
            } else {
              return home_screen();
            }

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
