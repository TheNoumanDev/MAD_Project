//import 'package:finalmad/screens/tasks/task4/task4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class drawer extends StatelessWidget {
  final Function(int) tileClicked;
  drawer({Key? key, required this.tileClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Muhammad Nouman Butt"),
            accountEmail: Text("2020-CS-110"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("abc"),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("All Widgets (Task 1,2)"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(0);
            },
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.face),
            title: const Text("Firebase CRUD (Task 4)"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(1);
            },
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.offline_bolt_outlined),
            title: const Text("Custom Widget (Task 5)"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(2);
            },
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.ac_unit_rounded),
            title: const Text("Shared Preferances (Task 6)"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(3);
              // Get.to(task4());
            },
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.health_and_safety),
            title: const Text("Image From Gallery (Task 7)"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(4);
            },
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Pushed Notifications (Task 13)"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(5);
            },
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.yard_sharp),
            title: const Text("APi CRUD (Task 11)"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(6);
            },
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.sailing),
            title: const Text("SQFLite"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(7);
            },
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.video_call_rounded),
            title: const Text("Video"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(8);
            },
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.tag_sharp),
            title: const Text("Authentication"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(9);
            },
            enabled: true,
          ),
          // ListTile(
          //   leading: const Icon(Icons.restart_alt),
          //   title: const Text("Rest Api"),
          //   onTap: () {
          //     Navigator.of(context).pop();
          //     tileClicked(10);
          //   },
          //   enabled: true,
          // ),
          // ListTile(
          //   leading: const Icon(Icons.join_right_rounded),
          //   title: const Text("Push Notification"),
          //   onTap: () {
          //     Navigator.of(context).pop();
          //     tileClicked(11);
          //   },
          //   enabled: true,
          // ),
        ],
      ),
    );
  }
}
