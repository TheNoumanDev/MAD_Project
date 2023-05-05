// ignore_for_file: file_names

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebaseAdd.dart';
import 'firebaseUpdate.dart';

String stringRep = "";
List mapRep = [];

enum MenuActions { Accounts, Forget }

class APIView extends StatefulWidget {
  const APIView({super.key});

  @override
  State<APIView> createState() => _APIViewState();
}

final fb = FirebaseDatabase.instance.ref().child('Person');
final reference = FirebaseDatabase.instance.ref().child('Person');
String _data = "";

class _APIViewState extends State<APIView> {
  Future apiCall() async {
    //final ref = fb.ref().child('users');

    // ref.once().then((DataSnapshot snapshot) {
    //       // setState(() {
    //       devtools.log("Data: ${snapshot.value}");
    //       //  _value  = snapshot.value;
    //       // });
    //     } as FutureOr Function(DatabaseEvent value));

    //   // http.Response response = await http
    //   //     .get(Uri.parse("https://pcc.edu.pk/ws/bscs2020/services.php"));
    //   // if (response.statusCode == 200) {
    //   //   setState(() {
    //   //     // stringRep = response.body;

    //   //     mapRep = json.decode(response.body);
    //   //   });
    //   // }
  }

  // _getData() {
  //   // ignore: deprecated_member_use
  //   final databaseReference = FirebaseDatabase.instance.reference();

  //   databaseReference.child("users").once().then((DataSnapshot snapshot) {
  //         setState(() {
  //           _data = snapshot.value;
  //         });
  //       } as FutureOr Function(DatabaseEvent value));
  // }

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  Widget listItem({required Map Students}) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, top: 5.0),
      margin: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            // wrap below Text widget with textrich widget to make it bold
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                    text: "Name: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                TextSpan(
                  text: Students['Name'],
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                )
              ]),
            ),
          ]),
          Row(children: [
            // wrap below Text widget with textrich widget to make it bold
            Expanded(
              child: RichText(
                text: TextSpan(children: [
                  const TextSpan(
                      text: "Email: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(
                      text: Students["Email"],
                      style: const TextStyle(color: Colors.black))
                ]),
              ),
            ),
          ]),
          Row(children: [
            // wrap below Text widget with textrich widget to make it bold
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                    text: "Phone Number: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                TextSpan(
                    text: Students["Number"],
                    style: const TextStyle(color: Colors.black))
              ]),
            ),
          ]),
          Row(children: [
            // wrap below Text widget with textrich widget to make it bold
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                    text: "Gender: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                TextSpan(
                    text: Students["Gender"],
                    style: const TextStyle(color: Colors.black))
              ]),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => InsertData());
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 25.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 9,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                UpdateRecord(studentKey: Students['key'])));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        size: 25.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 9,
                ),
                GestureDetector(
                  onTap: () {
                    // detele the record from firebase database using key
                    print(Students['key']);
                    reference.child(Students['key']).remove();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        size: 25.0,
                        color: Colors.red[700],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirebaseAnimatedList(
        query: fb,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          Map Students = snapshot.value as Map;
          Students['key'] = snapshot.key;

          return listItem(Students: Students);

          //return listItem(Students: Students);
        },
      ),
      //return Center(child: CircularProgressIndicator());

      //   child: mapRep == null
      //       ? const Text("Data is loading")
      //       : ListView.builder(
      //           itemCount: mapRep.length,
      //           itemBuilder: (context, index) {
      //             return Container(
      //               padding: const EdgeInsets.only(left: 10.0, top: 5.0),
      //               margin: const EdgeInsets.only(top: 10.0),
      //               decoration: BoxDecoration(
      //                 border: Border.all(color: Colors.black),
      //                 borderRadius: BorderRadius.circular(10.0),
      //               ),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Row(children: [
      //                     // wrap below Text widget with textrich widget to make it bold
      //                     RichText(
      //                       text: TextSpan(children: [
      //                         TextSpan(
      //                             text: "Title: ",
      //                             style: const TextStyle(
      //                                 fontWeight: FontWeight.bold,
      //                                 color: Colors.black)),
      //                         TextSpan(
      //                           text: mapRep[index]["title"],
      //                           style: const TextStyle(
      //                             color: Colors.black,
      //                           ),
      //                         )
      //                       ]),
      //                     ),
      //                   ]),
      //                   Row(children: [
      //                     // wrap below Text widget with textrich widget to make it bold
      //                     Expanded(
      //                       child: RichText(
      //                         text: TextSpan(children: [
      //                           TextSpan(
      //                               text: "Description: ",
      //                               style: const TextStyle(
      //                                   fontWeight: FontWeight.bold,
      //                                   color: Colors.black)),
      //                           TextSpan(
      //                               text: mapRep[index]["description"],
      //                               style: const TextStyle(color: Colors.black))
      //                         ]),
      //                       ),
      //                     ),
      //                   ]),
      //                   Row(children: [
      //                     // wrap below Text widget with textrich widget to make it bold
      //                     RichText(
      //                       text: TextSpan(children: [
      //                         TextSpan(
      //                             text: "Status: ",
      //                             style: const TextStyle(
      //                                 fontWeight: FontWeight.bold,
      //                                 color: Colors.black)),
      //                         TextSpan(
      //                             text: mapRep[index]["status"],
      //                             style: const TextStyle(color: Colors.black))
      //                       ]),
      //                     ),
      //                   ]),
      //                 ],
      //               ),
      //             );
      //           },
      //         ),

      // drawer: Drawer(
      //   child: ListView(
      //     padding: const EdgeInsets.all(0),
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.lightBlue,
      //         ), //BoxDecoration
      //         child: UserAccountsDrawerHeader(
      //           decoration: BoxDecoration(color: Colors.lightBlue),
      //           accountName: Text(
      //             "Muhammad Nouman",
      //             style: TextStyle(fontSize: 18),
      //           ),
      //           accountEmail: Text("TheNoumanDev@gmail.com"),
      //           currentAccountPictureSize: Size.square(50),
      //           currentAccountPicture: CircleAvatar(
      //             backgroundColor: Colors.white,
      //             child: Text(
      //               "A",
      //               style: TextStyle(fontSize: 30.0, color: Colors.blue),
      //             ), //Text
      //           ), //circleAvatar
      //         ), //UserAccountDrawerHeader
      //       ), //DrawerHeader
      //       ListTile(
      //         leading: const Icon(Icons.person),
      //         title: const Text(' Accounts '),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.of(context).pushNamedAndRemoveUntil(
      //               AccountViewRoute, (route) => false);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.room_service),
      //         title: const Text(' Add New Service '),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.of(context)
      //               .pushNamedAndRemoveUntil(InsertAPIRoute, (route) => true);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.settings),
      //         title: const Text(' Settings '),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.lock),
      //         title: const Text(' Forget '),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.of(context)
      //               .pushNamedAndRemoveUntil(ForgetViewRoute, (route) => false);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.logout),
      //         title: const Text('LogOut'),
      //         onTap: () {
      //           Navigator.pop(context);
      //           FirebaseAuth.instance.signOut();
      //           Navigator.of(context)
      //               .pushNamedAndRemoveUntil(LoginViewRoute, (route) => false);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
