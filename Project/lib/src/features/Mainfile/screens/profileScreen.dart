import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_final_ass/src/features/Mainfile/screens/task11_api.dart';
import 'package:mad_final_ass/src/features/Mainfile/screens/task13_push.dart';
import 'package:mad_final_ass/src/features/Mainfile/screens/task1_2.dart';
import 'package:mad_final_ass/src/features/Mainfile/screens/task4_CRUD/task3_firebaseCRUD.dart';
import 'package:mad_final_ass/src/features/Mainfile/screens/task5_customWidgets.dart';
import 'package:mad_final_ass/src/features/Mainfile/screens/task6_sharedPre.dart';
import 'package:mad_final_ass/src/features/Mainfile/screens/task7_images.dart';
import 'package:mad_final_ass/src/features/Mainfile/screens/task8/view/insert.dart';
import 'package:mad_final_ass/src/features/Mainfile/screens/task8/view/view_all.dart';
import 'package:mad_final_ass/src/features/Mainfile/screens/task8_sqf.dart';
import 'package:mad_final_ass/src/features/Mainfile/screens/task9_video.dart';
import 'package:mad_final_ass/src/features/authentication/screens/login_screen/login_screen.dart';
import '../../../utilities/drawer.dart';

//import 'drawer.dart';
// import 'tasks/task6/task6.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int recentScreen = 0;

  final List<Widget> screens = [
    task1_2(),
    const APIView(),
    MainScreen(),
    SharedPre(),
    imageupload(),
    TaskThirteen(),

    ApiCrud(),
    view_all(),
    const VideoPlayerScreen(
        videoUrl:
            "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4"),
    insert(),
    // const TaskThree(),
    // const task4(),
    // const taskFive(),
    // const taskSix(),
  ];

  openScreen(int id) {
    setState(() {
      recentScreen = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Integration of All tasks"),
        backgroundColor: Colors.white24,
        actions: [
          // write action for logout
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Get.to(() => LoginScreen());
              // Navigate to login screen or wherever you want to go after logout
            },
          ),
        ],
      ),
      drawer: drawer(tileClicked: openScreen),
      body: screens[recentScreen],
    );
  }
}
